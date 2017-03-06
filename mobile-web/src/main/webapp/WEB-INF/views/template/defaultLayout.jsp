<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title" /></title>
    <link id="callCss" rel="stylesheet" href="<c:url value="/resources/css/bootshop/bootstrap.min.css" />" media="screen"/>
<link href="<c:url value="/resources/font-awesome-4.5.0/css/font-awesome.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>" media="screen" rel="stylesheet">
<link href="<c:url value="/resources/css/base.css"/>" media="screen" rel="stylesheet">
<link href="<c:url value="/resources/js/google-code-prettify/prettify.css"/>" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<tiles:insertAttribute name="sidebar" />
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
	<footer class="footer-content">
		<tiles:insertAttribute name="footer" />
	</footer>
	<%-- <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/google-code-prettify/prettify.js"/>"></script>
	<script src="<c:url value="/resources//js/bootshop.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.lightbox-0.5.js"/>"></script>
</body>
</html>