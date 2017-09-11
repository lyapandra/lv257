<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<title>${title}</title>

	<jsp:include page="metadata.jsp"/>
</head>

<body>

	<jsp:include page="_menu2.jsp"/>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</button>
			<a class="navbar-brand" rel="home" href="Main.html"
			title="Project Resources"> <img
			style="max-width: 100px; margin-top: -10px;"
			src="../../resources/img/resources-logo.png">
		</a> <a class="navbar-brand" rel="home" href="Main.html"
		title="Project Resources"> <img style="max-width: 100px"
		src="../../resources/img/text.png"></a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li><a href="LookUpResources.html">Look up</a></li>
			<li><a href="ManageUsersAndRoles.html">Users</a></li>
			<li class="active"><a href="#">Resources</a></li>
			<li><a href="CommunityView.html">Community</a></li>
			<li><a href="#about">About</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="language-panel"><a href="" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"><span class="glyphicon glyphicon-globe"></span>
				Language<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="">English</a></li>
					<li><a href="">Ukrainian</a></li>
					<li><a href="">Russian</a></li>
				</ul>
			</li>
			<li class="Account"><a href="" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
				Profile/(as Register) <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="Profile.html">Sign in as Register</a></li>

					<li role="separator" class="divider"></li>

					<li role="separator" class="divider"></li>
					<li class="dropdown-header">User Profile</li>
					<li><a href="Profile.html">Your profile</a></li>
					<li><a href="Account.html">Settings</a></li>
					<li><a href="">Help</a></li>
					<li><a href="Signin.html">Sign out</a></li>
					<li role="separator" class="divider"></li>
					<li class="dropdown-header">Debug information</li>
					<li><a href="">A.15 <br>
					</a></li>
				</ul>
			</li>
		</li>
	</ul>
</div>
</div>
</nav>
<br/>


<div class="wrapper">
	<div class="container-fluid">
		<div class="col-sm-12 col-md-12">

			<div class="container">

				<ul class="nav nav-tabs">
					<li class="active"><a href="#">Register resource</a></li>
					<li><a href="ResourcesSendRequest.html">Send request</a></li>
					<li><a href="ResourcesHistory.html">History</a></li>
				</ul>
				<br>
				<br>

				<!-- MAIN FORM FOR REGISTRATING RESOURCE -->

				<form role="form-horizontal" enctype="multipart/form-data">

					<div class="form-group">
						<label for="resource_type">Resource type</label>
						<%--<select name="resource type" id="resource type">--%>
						<select type="resource_type" id="resource_type" class="form-control selectpicker"
						data-live-search="true"
						title="Choose one of the following">
						<c:forEach items="${resourceTypes}" var="resource">
						<option>${resource.typeName}</option>
					</c:forEach>
				</select>
				<%--<option disabled style="background-color: lightgray; text-indent: 0px;">Capital</option>--%>
				<%--<option disabled style="background-color: lightgray; text-indent: 10px;">Real Estate</option>--%>
				<%--<option style="text-indent: 20px;">Cottages</option>--%>
				<%--<option style="text-indent: 20px;">Apartment Buildings</option>--%>
				<%--<option disabled style="background-color: lightgray; text-indent: 10px;">Transport</option>--%>
				<%--<option style="text-indent: 20px;">Vehicles</option>--%>
				<%--<option style="text-indent: 20px;">Trucks</option>--%>
			</div>

                    <!-- <div class="form-group">
                        <label for="resource name">Resource name</label>
                        <select id="resource name" type="resource name" class="form-control">
                            <option>Appartment</option>
                            <option>House</option>
                            <option>Warehouse</option>
                            <option>Office buildings</option>
                        </select>
                      </div> -->

                      <div class="form-group">
                      	<label for="owners">Resource Owners</label>
                      	<select type="owners" id="owners" class="form-control" multiple>
                      		<option>Owner 1</option>
                      		<option>Owner 2</option>
                      		<option>Owner 3</option>
                      		<option>Owner 4</option>
                      	</select>
                      </div>
                      <div class="padding_bottom_15">
                      	<button class="btn btn-primary"
                      	type="button" data-toggle="modal"
                      	data-target="#myModal">Add from existing owners
                      </button>
                      <button class="btn btn-primary"
                      type="button" data-toggle="modal"
                      data-target="#myModal3">Add new Owner
                    </button>
                  </div>

                  <div id="myModal" class="modal fade">
                  	<div class="modal-dialog">
                  		<div class="modal-content">

                  			<div class="modal-header">
                  				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  					&times;
                  				</button>
                  				<h4>Find owner</h4>
                  			</div>

                  			<div class="modal-body">

                  				<label for="owner_search">Select type of Owner:</label>
                  				<select id="owner_search" class="form-control">
                  					<option value="1">Choose type here</option>
                  					<option value="2">Company</option>
                  					<option value="3">Person</option>
                  				</select>

                  				<div class="find_company display_none">

                  					<form class="form">
                  						<div class="form-group">
                  							<label for="search_company_by">Search by:</label>
                  							<select id="search_company_by" class="form-control">
                  								<option value="1">Choose</option>
                  								<option value="2">Name of the company</option>
                  								<option value="3">IPN number</option>
                  							</select>
                  						</div>

                  						<div class="search_company_name display_none">
                  							<div class="form-group">
                  								<label for="searchcompanyname">Name of the company</label>
                  								<input type="text" class="form-control" id="searchcompanyname"
                  								placeholder="Put name of the company: e.g. 'Sunshine'">
                  							</div>
                  							<div class="padding_bottom_15">
                  								<button type="button" class="btn btn-primary">Find Owner<a
                  									href="LookUpResources4.html">/</a></button>
                  								</div>
                  							</div>
                  							<div class="search_ipn_number display_none">
                  								<div class="form-group">
                  									<label for="ipn_number">IPN number</label>
                  									<input type="text" class="form-control" id="ipn_number"
                  									placeholder="IPn number">
                  								</div>
                  								<div class="padding_bottom_15">
                  									<button type="button" class="btn btn-primary">Find Owner<a
                  										href="LookUpResources4.html">/</a></button>
                  									</div>
                  								</div>

                  								<div id="owners_search_result" class="form-group">
                  									<label for="exampleFormControlSelect1">Result of Owner research. Please,
                  										choose special ownery to make Search Resource
                  									</label>
                  									<select multiple class="form-control" id="exampleFormControlSelect1">
                  										<option>Company 1</option>
                  										<option>Company 2</option>
                  										<option>Company 3</option>
                  										<option>Company 4</option>
                  										<option>Company 5</option>
                  									</select>
                  								</div>
                  								<div>
                  									<button type="button" class="btn btn-success pull-right">Choose</button>
                  								</div>
                  								<div class="clearfix"></div>
                  							</form>

                  						</div>

                  						<div class="find_person display_none">

                  							<form class="form">
                  								<div class="form-group">
                  									<label for="search_person_by">Search by:</label>
                  									<select id="search_person_by" class="form-control">
                  										<option value="1">Choose</option>
                  										<option value="2">Person's name</option>
                  										<option value="3">Pasport series</option>
                  									</select>
                  								</div>
                  								<div class="persons_name_search display_none">
                  									<div class="form-group">
                  										<label for="owner_first_name">Person's first name</label>
                  										<input type="text" class="form-control" id="owner_first_name"
                  										placeholder="Put name of the person here: e.g. 'Ivan'">
                  									</div>
                  									<div class="form-group">
                  										<label for="owner_last_name">Person's last name</label>
                  										<input type="text" class="form-control" id="owner_last_name"
                  										placeholder="Put name of the person here: e.g. 'Ivanov'">
                  									</div>
                  									<div class="padding_bottom_15">
                  										<button type="button" class="btn btn-primary">Find Owner<a
                  											href="LookUpResources4.html">/</a></button>
                  										</div>
                  									</div>
                  									<div class="persons_passport_search display_none">
                  										<div class="row">
                  											<div class="col-sm-4">
                  												<div class="form-group">
                  													<label for="passport_series">Person's passport
                  														series</label>
                  														<input type="text" class="form-control" id="passport_series"
                  														placeholder="KC">
                  													</div>
                  												</div>
                  												<div class="col-sm-8">
                  													<div class="form-group">
                  														<label for="passport_number">Person's passport
                  															number</label>
                  															<input type="text" class="form-control" id="passport_number"
                  															placeholder="789315">
                  														</div>
                  													</div>
                  												</div>
                  												<div class="padding_bottom_15">
                  													<button type="button" class="btn btn-primary">Find Owner<a
                  														href="LookUpResources4.html">/</a></button>
                  													</div>
                  												</div>
                  												<div class="form-group">
                  													<label for="exampleFormControlSelect1">Result of Owner research. Please,
                  														choose special ownery to make Search Resource</label>
                  														<select multiple class="form-control" id="exampleFormControlSelect1">
                  															<option>Person 1</option>
                  															<option>Person 2</option>
                  															<option>Person 3</option>
                  															<option>Person 4</option>
                  															<option>Person 5</option>
                  														</select>
                  													</div>
                  													<div class="padding_bottom_15">
                  														<button type="button" class="btn btn-success pull-right">Choose</button>
                  													</div>
                  													<div class="clearfix"></div>
                  												</form>

                  											</div>

                  										</div>
                  									</div>
                  								</div>
                  							</div>

                  							<div id="myModal3" class="modal fade">
                  								<div class="modal-dialog">
                  									<div class="modal-content">

                  										<div class="modal-header">
                  											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  												&times;
                  											</button>
                  											<h4>Add new Owner</h4>
                  										</div>
                  										<div class="modal-body">
                  											<div class="changable_form">

                  												<div class="select_ownertype padding_bottom_15">
                  													<label for="owner_type">Please specify what type of owner you want to
                  														add:</label>
                  														<select id="owner_type" class="form-control">
                  															<option value="1">Choose type here</option>
                  															<option value="2">Company</option>
                  															<option value="3">Person</option>
                  														</select>
                  													</div>

                  													<div id="owner_form">
                  														<div id="resource_owner_form">


                  														</div>

                  														<div id="owner_address_form">


                  														</div>

                  													</div>


                  												</div>
                  											</div>
                  										</div>
                  									</div>
                  								</div>

                  								<div class="form-group">
                  									<label for="address">Resource Address</label>
                  									<select type="address" id="address" class="form-control">
                  										<option>Address 1</option>
                  										<option>Address 2</option>
                  										<option>Address 3</option>
                  										<option>Address 4</option>
                  									</select>
                  								</div>
                  								<div class="padding_bottom_15">
                  									<button id="add_resource_address_btn"
                  									class="btn btn-primary"
                  									type="button" data-toggle="modal"
                  									data-target="#resourseAdressPopUp">
                  									Add Resource Address
                  								</button>
                  							</div>


                  							<div id="resourseAdressPopUp" class="modal fade">
                  								<div class="modal-dialog">
                  									<div class="modal-content">
                  										<div class="modal-header">
                  											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  												&times;
                  											</button>
                  											<h4>Resource Address</h4>
                  										</div>
                  										<div class="modal-body">

                  											<div id="resource_address_form_placeholder">

                  												<%--Here will be generated resource adress form--%>


                  											</div>

                  										</div>

                  									</div>
                  								</div>
                  							</div>


                  							<%--CONCRETE RESOURCE TYPE CHARACTERISTICS--%>

                  							<div class="rP_chars">


                  							</div>

                  							<div class="form-group">
                  								<label for="files">Registration basis</label>
                  								<input type="file" id="files" multiple="true">
                  							</div>
                  							<div class="padding_bottom_15">
                  								<button type="submit" class="btn btn-success">Register new resource</button>
                  							</div>


                  						</form>

                  					</div>
                  				</div>
                  			</div>
                  		</div>

                  		<footer class="footer">
                  			<div class="container">
                  				<p class="text-muted">&copy; Lv257_Java</p>
                  			</div>
                  		</footer>

                  		<script src="../../resources/js/custom.js"></script>
                  		<script>

    /**
     * When user changes resource type select,
     * than ajax request is being send to server (resource type name actual).
     * According to this resource type name all it's characteristics are retrieved from db
     * and rendered into the form.
     */
     $('#resource_type').on('change', function () {
        // on change select option resource type is retrieved
        var resourceTypeName = this.value;
        console.log("resource type name selected: " + resourceTypeName);

        $.ajax({
        	type: "POST",
        	contentType: "text/plain",
        	url: "/resources/characteristics",
            // it is send to the server
            data: resourceTypeName,
            accept: "application/json",
            success: function (result) {
            	alert(result);
                // here list of characteristics is retrieved
                // rP : [{},{} ..]
                var parse = JSON.parse(result);
                // div where to append inputs for caracteristics
                var propertyInput = $('.rP_chars');
                propertyInput.empty();
                for (var i = 0; i < parse.rP.length; i++) {
                	console.log(parse.rP[i].name);

                	var idForDiv = parse.rP[i].name + "_id";

                	var div = $('<div/>', {
                		id: idForDiv,
                		class: 'form-group',
                	});
                	propertyInput.append(div);

                	var label = $('<label/>', {
                		for: parse.rP[i].name,
                			text: parse.rP[i].name
                	});
                	div.append(label);

                	var input = $('<input/>', {
                		type: 'text',
                		class: 'form-control',
                		id: parse.rP[i].name,
                	});
                	div.append(input);

//                    Old Version
//                    var div = "<div class=\"form-group\">" +
//                        "<label for=\"" + parse.rP[i].name + "\">" + parse.rP[i].name + "</label>" +
//                        "<input type=\"text\" class=\"form-control\" id=\"" + parse.rP[i].name + "\" \>" +
//                        "</div>";

}
}
});
      });

     /* Generates resource addres form in the pop-up */
     $('#add_resource_address_btn').on('click', function () {
     	var placeholder = $('#resource_address_form_placeholder');
     	addAddressForm("resource", placeholder);
     });

     /* Generate owner form depending on owner type */
     $('#owner_type').on('change', function () {
     	var ownerType = this.value;
     	var formPlaceholder = $('#resource_owner_form');
     	var resourceAddressForm = $('#owner_address_form');

     	var company = [
     	[new FieldAndSize('Full Name', 12, 'Full Name')],
     	[new FieldAndSize('Short Name', 6, 'Short Name'), new FieldAndSize('Orgsnization Form', 6, 'TzOV')],
     	[new FieldAndSize('CEO', 12, 'CEO')],
     	[new FieldAndSize('Phone', 12, '+380679365998')]
     	];

     	var person = [
     	[new FieldAndSize('First Name', 6, 'First Name'), new FieldAndSize('Last Name', 6, 'Last Name')],
     	[new FieldAndSize('Middle Name', 12, 'Middle Name')],
     	[new FieldAndSize('Passport Series', 3, 'KC'), new FieldAndSize('Passport Number', 4, '149875'), new FieldAndSize('Personal Phone', 5, '+30679365998')]
     	];

     	if (ownerType == 1) {
     		formPlaceholder.empty();
     		resourceAddressForm.empty();
     	}
     	if (ownerType == 2) {
     		addOwnerForm(formPlaceholder, resourceAddressForm, "company", company);
     	}
     	if (ownerType == 3) {
     		addOwnerForm(formPlaceholder, resourceAddressForm, "person", person);
     	}


     });

     function addOwnerForm(formPlaceholder, resourceAddressForm, forWhat, rows) {
     	resourceAddressForm.empty();
     	formPlaceholder.empty();
     	var form = $('<form/>', {
     		class: 'form'
     	});

     	formPlaceholder.append(form);
     	appendRows(form, forWhat, rows);
     	var btnId = appendButton(form, forWhat, "Add address", false, false);
     	appendButton(form, forWhat, "Register new Owner", true, true);

     	var companyAddresBtn = $('#' + btnId);
     	companyAddresBtn.on('click', function (e) {
     		e.preventDefault();
     		$(this).hide();

     		addAddressForm("company", resourceAddressForm);
     	})
     }

    /**
     * Dynamic adding address form
     */
     function addAddressForm(addressFor, formPlaceholder) {
     	formPlaceholder.empty();
     	var form = $('<form/>', {
     		class: 'form'
     	});

     	var rows = [
     	[new FieldAndSize('Country', 6, 'Ukraine'), new FieldAndSize('Region', 6, 'Region')],
     	[new FieldAndSize('Distinct', 6, 'District'), new FieldAndSize('Postal Index', 6, '79060')],
     	[new FieldAndSize('Locality', 6, 'Locality'), new FieldAndSize('Street', 6, 'Shevchenka street')],
     	[new FieldAndSize('Building', 4, '35'), new FieldAndSize('Block', 4, 'A'), new FieldAndSize('Appartment', 4, '14')]
     	];

     	formPlaceholder.append(form);
     	appendRows(form, addressFor, rows);
     	var addressSubmitButtonId = appendButton(form, addressFor, "Register new Address", true, true);
     	return addressSubmitButtonId;
     }

     /* Appending rows*/
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
     				id: rows[i][j].fieldName + "_" + forWhat,
     				placeholder: rows[i][j].placeholder
     			});
     			formGroup.append(input);
     		}
     	}
     }

     /* Appending submit button*/
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

     /* Custom object for dynamic form building */
     function FieldAndSize(fieldName, size, placeholder) {
     	this.fieldName = fieldName;
     	this.size = size;
     	this.placeholder = placeholder;
     }

   </script>

 </body>
 </html>