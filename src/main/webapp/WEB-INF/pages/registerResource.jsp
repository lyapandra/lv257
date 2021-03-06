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
<br/>

<div class="wrapper">
    <div class="container-fluid">
        <div class="col-sm-12 col-md-12">

            <div class="container">

                <ul class="nav nav-tabs">
                    <li class="active"><a href="${pageCont1ext.request.contextPath}/resources/registration">Register resource</a></li>
                    <li><a href="${pageCont1ext.request.contextPath}/resources/request">Send request</a></li>
                    <li><a href="${pageContext.request.contextPath}/resources/history">History</a></li>
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
                            <%--<c:forEach items="${resourceTypes}" var="resource">--%>
                            <%--<option>${resource.typeName}</option>--%>
                            <%--</c:forEach>--%>

                            <option disabled style="background-color: lightgray; text-indent: 0px;">Capital</option>
                            <option disabled style="background-color: lightgray; text-indent: 10px;">Real Estate
                            </option>
                            <option style="text-indent: 20px;">Cottages</option>
                            <option style="text-indent: 20px;">Apartment Buildings</option>
                            <option disabled style="background-color: lightgray; text-indent: 10px;">Transport</option>
                            <option style="text-indent: 20px;">Vehicles</option>
                            <option style="text-indent: 20px;">Trucks</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="resource_owners" class="display_none">Resource Owners</label>
                        <select type="owners" id="resource_owners" class="form-control display_none" multiple>

                        </select>
                    </div>

                    <div class="form-group">
                        <div class="padding_bottom_15">
                            <button class="btn btn-primary"
                                    type="button" data-toggle="modal"
                                    data-target="#search_existing_owner">Add existing owner
                            </button>
                        </div>
                        <div>
                            <button class="btn btn-primary"
                                    type="button" data-toggle="modal"
                                    data-target="#createNewOwnerPopUp">Add new owner
                            </button>
                        </div>
                    </div>

                    <div id="search_existing_owner" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4>Find owner</h4>
                                </div>

                                <%--<div class="modal-body">--%>

                                    <%--<label for="owner_search">Select type of Owner:</label>--%>
                                    <%--<select id="owner_search" class="form-control">--%>
                                        <%--<option value="1">Choose type here</option>--%>
                                        <%--<option value="2">Company</option>--%>
                                        <%--<option value="3">Person</option>--%>
                                    <%--</select>--%>

                                    <%--<div id="search_existing_owner" class="modal fade">--%>
                                        <%--<div class="modal-dialog">--%>
                                            <%--<div class="modal-content">--%>

                                                <%--<div class="modal-header">--%>
                                                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                                                        <%--&times;--%>
                                                    <%--</button>--%>
                                                    <%--<h4>Find owner</h4>--%>
                                                <%--</div>--%>

                                                <%--<div class="modal-body">--%>

                                                    <%--<label for="owner_search">Select type of Owner:</label>--%>
                                                    <%--<select id="owner_search" class="form-control">--%>
                                                        <%--<option value="1">Choose type here</option>--%>
                                                        <%--<option value="2">Company</option>--%>
                                                        <%--<option value="3">Person</option>--%>
                                                    <%--</select>--%>


                                                    <%--<div id="search_owner_form">--%>


                                                    <%--</div>--%>


                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%----%>
                            </div>
                        </div>
                    </div>

                    <div id="createNewOwnerPopUp" class="modal fade">
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
                                                <option value="absent">Choose type here</option>
                                                <option value="company">Company</option>
                                                <option value="person">Person</option>
                                            </select>
                                        </div>

                                        <div id="owner_form">


                                            <div id="resource_new_owner_form">

                                                <%--Here owner form will be rendered--%>

                                            </div>

                                            <div id="owner_address_form">

                                                <%--Here owner address form will be rendered--%>

                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="resource_address" class="display_none">Resource Address</label>
                        <select type="address" id="resource_address" class="form-control display_none">

                            <%--Concrete address typed by user will be placed here like <option>--%>

                        </select>
                    </div>


                    <div class="padding_bottom_15">
                        <button id="add_resource_address_btn"
                                class="btn btn-primary"
                                type="button" data-toggle="modal"
                                data-target="#resourseAdressPopUp">
                            Add resource address
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

                    <div class="rP_chars">

                        <%--CONCRETE RESOURCE TYPE CHARACTERISTICS--%>

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

<a href="/resources/companies" >Companies</a>
<a href="/resources/persons" >Persons</a>

<footer class="footer">
    <div class="container">
        <p class="text-muted">&copy; Lv257_Java</p>
    </div>
</footer>

<script src="../../resources/js/addNewOwnerAndAddress.js"></script>
<script src="../../resources/js/jquery.validate.js"></script>
<script>



</script>

</body>
</html>