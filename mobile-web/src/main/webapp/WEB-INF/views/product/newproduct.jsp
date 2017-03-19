<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="span9">
	<div class="row-fluid">
		<h3 class="center-block">New Product</h3>
	</div>
	<div class="row-fluid">
		<br />
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="col-sm-5 alert alert-danger">
				<strong>${ERROR_MESSAGE}</strong>
			</div>
		</c:if>
	</div>
	<form:form method="POST" modelAttribute="product"
		action="new?${_csrf.parameterName}=${_csrf.token}"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<span class="error text-danger" style="color: red;"><form:errors
				path="id" /></span>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">Name </label>
			<div class="col-sm-8">
				<form:input path="name" class="form-control" id="name"
					placeholder="Name..." />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="name" /></span>
		</div>
		<div class="form-group">
			<form:label path="category" class="control-label col-sm-2">Category </form:label>
			<div class="col-sm-8">
				<form:select path="category" items="${categories}" itemValue="id"
					itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="category" /></span>
		</div>
		<div class="form-group">
			<form:label path="publisher" class="control-label col-sm-2">Publisher </form:label>
			<div class="col-sm-8">
				<form:select path="publisher" items="${publishers}" itemValue="id"
					itemLabel="name" class="form-control" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="publisher" /></span>
		</div>
		<div class="form-group">
			<form:label path="description" class="control-label col-sm-2">Description </form:label>
			<div class="col-sm-8">
				<form:textarea path="description" class="form-control"
					placeholder="Description..." />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="description" /></span>
		</div>
		<div class="form-group">
			<c:forEach varStatus="vs" items="${product.getPrices()}">
				<form:label path="prices[${vs.index}].money"
					class="control-label col-sm-2">Prices </form:label>
				<div class="col-sm-8">
					<form:input path="prices[${vs.index}].money" class="form-control"
						type="number" placeholder="Input digist.." />
				</div>
				<span class="error text-danger" style="color: red;"><form:errors
						path="prices[${vs.index}].money" /></span>
			</c:forEach>
		</div>
		<div class="form-group">
			<form:label path="quantity" class="control-label col-sm-2">Quantity </form:label>
			<div class="col-sm-8">
				<form:input path="quantity" class="form-control" type="number" />
			</div>
			<span class="error text-danger" style="color: red;"><form:errors
					path="quantity" /></span>
		</div>
		<div class="row-fluid">
			<p>
				Images(Min = 1, Max = 5) <a type="button" id='addPlayer'
					class="btn btn-normal btn-default">+</a><a type="button"
					id='removePlayer' class="btn btn-normal btn-default">-</a>
		</div>
		<span class="error text-danger" style="color: red;"><form:errors
				path="images" /></span>
		<div id="input-player-list">
			<input type='file' name="fileUpload" accept="image/*">
		</div>
		<br>
		<div class="row-fluid">
			<div class="col-sm-6">
				<input type="submit" value="Save" class="btn btn-success"
					type="button" />
			</div>
			<div class="col-sm-6">
				<a type="button" class="pull-right btn btn-lg btn-default"
					href="${pageContext.request.contextPath}/admin/product">Back</a>
			</div>
		</div>
	</form:form>
</div>
<script>
	document.getElementById('addPlayer').onclick = function createInputField() {
		var numItems = $('input[name="fileUpload"]').length;
		if (numItems < 5) {
			var input = document.createElement('input');
			var lineBreak = document.createElement('br');
			var i = 0;
			var x = document.getElementsByTagName('INPUT').length - 2;
			for (i = 0; i < x; i++) {
				i;
			}
			input.setAttribute('id', 0 + i);
			input.type = 'file';
			input.name = 'fileUpload';
			input.accept = 'image/*';
			var aplayer1 = document.getElementById('input-player-list');
			aplayer1.appendChild(input);
			aplayer1.appendChild(lineBreak);
		}
	}

	document.getElementById('removePlayer').onclick = function removeInputField() {
		var x = document.getElementsByTagName('INPUT').length;
		if (x > 3) {
			$('#input-player-list input:last').remove();
			$('#input-player-list br:last').remove();
			return false;
		} else {
		}
	}
</script>