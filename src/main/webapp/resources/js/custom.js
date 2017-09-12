$('#show_owner_person_address_form').click(function(){
    $('.owner_person_address_form').slideToggle(450);
    return false;
});

$('#show_owner_company_address_form').click(function(){
    $('.owner_company_address_form').slideToggle(450);
    return false;
});

$(document).ready(function(){

    $("#owner_search").change(function(){
        var valOpt2 = $(this).find('option:selected').val();
        if(valOpt2==1){
            $('.find_person').slideUp(400);
            $('.find_company').slideUp(400);
        }
        if(valOpt2==2){
            $('.find_company').delay(450).slideToggle(450);
            $('.find_person').slideUp(450);
        }
        if(valOpt2==3){
            $('.find_person').delay(450).slideToggle(450);
            $('.find_company').slideUp(450);
        }

    });

    $("#owner_type").change(function(){
        var valOpt = $(this).find('option:selected').val();
        if(valOpt==1){
            $('.add_person').slideUp(400);
            $('.add_company').slideUp(400);
        }
        if(valOpt==2){
            $('.add_company').delay(450).slideToggle(450);
            $('.add_person').slideUp(450);
        }
        if(valOpt==3){
            $('.add_person').delay(450).slideToggle(450);
            $('.add_company').slideUp(450);
        }

    });

    $("#search_company_by").change(function(){
        var valOpt = $(this).find('option:selected').val();
        if(valOpt==1){
            $('.search_company_name').slideUp(400);
            $('.search_ipn_number').slideUp(400);
        }
        if(valOpt==2){
            $('.search_company_name').delay(450).slideToggle(450);
            $('.search_ipn_number').slideUp(450);
        }
        if(valOpt==3){
            $('.search_ipn_number').delay(450).slideToggle(450);
            $('.search_company_name').slideUp(450);
        }

    });

    $("#search_person_by").change(function(){
        var valOpt = $(this).find('option:selected').val();
        if(valOpt==1){
            $('.persons_name_search').slideUp(400);
            $('.persons_passport_search').slideUp(400);
        }
        if(valOpt==2){
            $('.persons_name_search').delay(450).slideToggle(450);
            $('.persons_passport_search').slideUp(450);
        }
        if(valOpt==3){
            $('.persons_passport_search').delay(450).slideToggle(450);
            $('.persons_name_search').slideUp(450);
        }

    });

});

/**
 * Custom object for dynamic form building.
 * Holds fieldName, size of column and placeholder for the input
 *
 */
function FieldAndSize(fieldName, size, placeholder) {
    this.fieldName = fieldName;
    this.size = size;
    this.placeholder = placeholder;
}

/** Appending submit button to the form.
 * Takes:
 * element  - form itself,
 * string   - forWhat - purpose of this button, needed to generate button id
 * string   - text - text that will be placed on button
 * boolean  - right - if true, btn will be placed in the right corner, if not - left
 * boolean  - success - if true, btn will green , if not - blue
 *
 */
function appendButton(form, forWhat, text, right, success) {
    var successButton = $('<button/>', {
        class: 'btn' +
        (right ? ' pull-right ' : ' pull-left ') +
        (success ? ' btn-success ' : ' btn-primary '),
        type: 'submit',
        text: text,
        id: forWhat + '_custom_btn'
    });
    var clearfix = $('<div/>', {
        class: 'clearfix'
    });
    form.append(successButton);
    form.append(clearfix);
    var tempId = forWhat + '_custom_btn';
    return tempId;
}

/** Appending rows.
 * Each row in the array is the <div class="row"> and may have one
 * or more input tages.
 * This method genertes all this element and append them to each other
 * and to the giveb form.
 */
function appendRows(form, forWhat, rows) {
    for (var i = 0; i < rows.length; i++) {
        var row = $('<div/>', {
            class: 'row'
        });
        form.append(row);

        for (var j = 0; j < rows[i].length; j++) {
            var col = $('<div/>', {
                class: 'col-sm-' + rows[i][j].size
            });
            row.append(col);

            var formGroup = $('<div/>', {
                class: 'form-group',
            });
            col.append(formGroup);
            var label = $('<label/>', {
                for: rows[i][j].fieldName + "_" + forWhat,
                text: rows[i][j].fieldName
            });
            formGroup.append(label);

            var input = $('<input/>', {
                type: 'text',
                class: 'form-control',
                name : rows[i][j].fieldName,
                id: rows[i][j].fieldName + "_" + forWhat,
                placeholder: rows[i][j].placeholder
            });
            formGroup.append(input);
        }
    }
}