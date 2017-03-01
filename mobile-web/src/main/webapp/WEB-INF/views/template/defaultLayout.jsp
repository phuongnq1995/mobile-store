<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title" /></title>
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/font-awesome-4.5.0/css/font-awesome.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/layout.css" />"
	rel="stylesheet">
</head>
<body>
	<tiles:insertAttribute name="header" />
	<div class="body-content container-fluid">
		<tiles:insertAttribute name="body" />
	</div>
	<footer class="footer-content">
		<tiles:insertAttribute name="footer" />
	</footer>
	<script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>