<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<div class="container">
	<div id="welcomeLine" class="row">
		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name != null}">
				<div class="span6">
					Welcome!<strong> ${pageContext.request.userPrincipal.name}</strong>
				</div>
			</c:when>

			<c:otherwise>
				<div class="span6"></div>
			</c:otherwise>

		</c:choose>
		<div class="span6">
			<div class="pull-right">
				<span class="btn btn-mini">En</span>
			</div>
		</div>
	</div>
	<!-- Navbar ================================================== -->
	<div id="logoArea" class="navbar">
		<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
			class="btn btn-navbar"> <span class="icon-bar"></span> <span
			class="icon-bar"></span> <span class="icon-bar"></span>
		</a>
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.request.contextPath}/"><img
				src="<c:url value="/resources/images/logo.png"/>" alt="Bootsshop" /></a>
			<form class="form-inline navbar-search" method="get"
				action="${pageContext.request.contextPath}/searchProduct">
				<input id="srchFld" class="form-control" type="text" name="key"
					placeholder="Search..." />
				<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
			</form>
			<ul id="topMenu" class="nav pull-right">
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li class=""><a
						href="${pageContext.request.contextPath}/admin/product">Admin
							Manager</a></li>
				</security:authorize>
				<li class=""><a
					href="${pageContext.request.contextPath}/specialoffer">Specials
						Offer</a></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/contact">Contact</a></li>
				<li class=""><c:choose>
						<c:when test="${pageContext.request.userPrincipal.name != null}">
							<a onclick="document.forms['logoutForm'].submit()" role="button"
								style="padding-right: 0"><span
								class="btn btn-large btn-warning">Log out</span></a>
							<form id="logoutForm" method="POST" action="${pageContext.request.contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</c:when>
						<c:otherwise>
							<a href="#login" role="button" data-toggle="modal"
								style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a>

							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3>Login Block</h3>
								</div>
								<div class="modal-body">
									<form method="POST"
										action="${pageContext.request.contextPath}/login">
										<div class="form-group">
											<label for="email">Email:</label> <input name="email"
												type="email" placeholder="Email" class="form-control"
												id="email" />
										</div>
										<div class="form-group">
											<span>${message}</span> <span>${error}</span>
										</div>
										<div class="form-group">
											<label for="password">Password:</label> <input
												name="password" type="password" placeholder="Password"
												class="form-control" id="password" />
										</div>
										<div class="form-group">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" class="form-control" />
										</div>
										<button class="btn btn-lg btn-primary" type="submit">Sign
											In</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
									<h4 class="text-center">
										<a href="registration">Create an account</a>
									</h4>
								</div>
							</div>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
	</div>
</div>

<!-- Header End====================================================================== -->