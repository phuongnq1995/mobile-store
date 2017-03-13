<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
	</ul>
	<h3>Registration</h3>
	<div class="well">
		<form:form method="POST" modelAttribute="user"
			class="form-horizontal">
			<h4>Your personal information</h4>
			<div class="control-group">
				<label class="control-label" for="inputFname1">Full name <sup>*</sup></label>
				<div class="controls">
					<form:input path="fullName" placeholder="Full Name"/>
					<span class="error text-danger" style="color: red;"><form:errors
							path="fullName"></form:errors></span>
				</div>
			</div>
			<spring:bind path="email">
				<div class="control-group ${status.error ? 'has-error' : ''}">
					<label class="control-label" for="email">Email <sup>*</sup></label>
					<div class="controls">
						<form:input type="email" path="email" placeholder="Email" />
						<span class="error text-danger" style="color: red;"><form:errors
								path="email"></form:errors></span>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="password">
				<div class="control-group ${status.error ? 'has-error' : ''}">
					<label class="control-label" for="password">Password <sup>*</sup></label>
					<div class="controls">
						<form:input type="password" path="password" placeholder="Password" />
						<span class="error text-danger" style="color: red;"><form:errors
								path="password"></form:errors></span>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="passwordConfirm">
				<div class="control-group">
					<label class="control-label" for="passwordConfirm">Password
						Confirm<sup>*</sup>
					</label>
					<div class="controls">
						<form:input type="password" path="passwordConfirm"
							placeholder="Confirm your password" />
						<span class="error text-danger" style="color: red;"><form:errors
								path="passwordConfirm"></form:errors></span>
					</div>
				</div>
			</spring:bind>
			<h4>Your address</h4>
			<div class="control-group">
				<label class="control-label" for="street">Address<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="street"
						placeholder="Street, Company.." />
					<span class="error text-danger" style="color: red;"><form:errors
							path="street"></form:errors></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="city">City<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="city" placeholder="City" />
					<span class="error text-danger" style="color: red;"><form:errors
							path="city"></form:errors></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="state">State<sup>*</sup></label>
				<div class="controls">
					<form:input type="text" path="state" placeholder="State" />
					<span class="error text-danger" style="color: red;"><form:errors
							path="state"></form:errors></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phone">Phone number*</label>
				<div class="controls">
					<form:input type="text" path="phone" id="mobile"
						placeholder="Mobile Phone" />
					<span class="error text-danger" style="color: red;"><form:errors
							path="phone"></form:errors></span>
				</div>
			</div>
			<p>
				<sup>*</sup>Required field
			</p>

			<div class="control-group">
				<div class="controls">
					<input class="btn btn-large btn-success" type="submit"
						value="Register" />
				</div>
			</div>
		</form:form>
	</div>

</div>
