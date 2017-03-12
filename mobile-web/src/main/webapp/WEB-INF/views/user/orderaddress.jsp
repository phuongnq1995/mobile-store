<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
	</ul>
	<h3>Registration</h3>
	<div class="well">
		<form:form method="POST" modelAttribute="user" action="orderaddress"
			class="form-horizontal">
			<h4>Your personal information</h4>
			<div class="control-group">
				<label class="control-label" for="fullName">Full name <sup>*</sup></label>
				<div class="controls">
					<form:input path="fullName" placeholder="Full name" />
					<span class="error text-danger" style="color: red;"><form:errors path="fullName" /></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email <sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="email" placeholder="Email" />
					<span class="error text-danger" style="color: red;"><form:errors path="email" /></span>
				</div>
			</div>
			<h4>Your address</h4>
			<div class="control-group">
				<label class="control-label" for="street">Address<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="street" placeholder="Street address, P.O. box, company name, c/o" />
					<span class="error text-danger" style="color: red;"><form:errors path="city" /></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">City<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="city" placeholder="city" />
					<span class="error text-danger" style="color: red;"><form:errors path="city" /></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">State<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="state"
						placeholder="State" />
					<span class="error text-danger" style="color: red;"><form:errors path="state" /></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="mobile">Phone number</label>
				<div class="controls">
					<form:input type="text" path="phone"
						placeholder="Mobile Phone" />
					<span class="error text-danger" style="color: red;"><form:errors path="phone" /></span>
				</div>
			</div>
			<p>
				<sup>*</sup>Required field
			</p>

			<div class="control-group">
				<div class="controls">
					<input class="btn btn-large btn-success" type="submit"
						value="Order" />
				</div>
			</div>
		</form:form>
	</div>

</div>
