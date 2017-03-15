<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<div class="row-fuild">
		<div class="col-xs-4 col-md-4">
			<h3>Publishers</h3>
		</div>
		<div class="col-xs-8 col-md-8">
			<div class="btn-group btn-group-justified pull-right">
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/product">Products</a>
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/members">Members</a>
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/categories">Categories</a>
				<a type="button" class="btn btn-default"
					href="${pageContext.request.contextPath}/admin/publishers">Publishers</a>
			</div>
		</div>
	</div>
	<br />
	<div class="row-fluid">
		<br />
		<c:if test="${SUCCESS_MESSAGE != null}">
			<div class="col-sm-5 alert alert-success">
				<strong>${SUCCESS_MESSAGE}</strong>
			</div>
		</c:if>
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="col-sm-5 alert alert-danger">
				<strong>${ERROR_MESSAGE}</strong>
			</div>
		</c:if>
	</div>
	<div class="row-fluid">
		<a href="publisher/new"><i class="fa fa-plus-square-o"
			style="font-size: 16px">Add New Publisher</i></a>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Action Edit</th>
					<th>Action Delete</th>
			</thead>
			<tbody>
				<c:forEach var="publisher" items="${publishers}">
					<tr>
						<td>${publisher.id}</td>
						<td>${publisher.name}</td>
						<td><a href="publisher/${publisher.id}"
							class="btn btn-warning" type="button">Edit</a></td>
						<td><a role="button" class="btn btn-danger"
							data-toggle="modal" href="#myModal_${publisher.id}">Delete</a>
							<div class="modal fade bs-example-modal-sm"
								id="myModal_${publisher.id}">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Are You Sure?</h4>
										</div>
										<div class="modal-body">
											<p>You have to delete all products of this
												publisher&hellip;</p>
										</div>
										<div class="modal-footer">
											<a href="publisher/delete/${publisher.id}"
												class="btn btn-danger pull-left" type="button">Delete</a>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</c:forEach>
			<tbody>
		</table>
	</div>
</div>