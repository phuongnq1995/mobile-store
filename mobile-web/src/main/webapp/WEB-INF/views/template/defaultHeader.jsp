<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
				<span class="btn btn-mini">En</span> <span class="btn btn-mini">$155.00</span>
				<a href="product_summary.html"><span
					class="btn btn-mini btn-primary"> <i
						class="fa fa-shopping-cart" style="font-size: 16px; color: white"></i>
						[ 3 ] Itemes in your cart
				</span> </a>
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
			<form class="form-inline navbar-search" method="post"
				action="products.html">
				<input id="srchFld" class="srchTxt" type="text" /> <select
					class="srchTxt">
					<option>All</option>
					<option>CLOTHES</option>
					<option>FOOD AND BEVERAGES</option>
					<option>HEALTH & BEAUTY</option>
					<option>SPORTS & LEISURE</option>
					<option>BOOKS & ENTERTAINMENTS</option>
				</select>
				<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
			</form>
			<ul id="topMenu" class="nav pull-right">
				<li class=""><a href="special_offer.html">Specials Offer</a></li>
				<li class=""><a href="normal.html">Delivery</a></li>
				<li class=""><a href="contact.html">Contact</a></li>
				<li class=""><c:choose>
						<c:when test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST" action="logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
							<a onclick="document.forms['logoutForm'].submit()" role="button"
								style="padding-right: 0"><span
								class="btn btn-large btn-warning">Log out</span></a>
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
									<!-- 									<form class="form-horizontal loginFrm">
										<div class="control-group">
											<input type="text" id="inputEmail" placeholder="Email">
										</div>
										<div class="control-group">
											<input type="password" id="inputPassword"
												placeholder="Password">
										</div>
									</form> -->
									<form method="POST" action="${pageContext.request.contextPath}/login"
										class="form-horizontal loginFrm">
										<div class="form-group ${error != null ? 'has-error' : ''}">
											<span>${message}</span> <input name="email" type="text"
												class="form-control" placeholder="email" autofocus="autofocus"/>
											<input name="password" type="password" class="form-control"
												placeholder="Password" /> <span>${error}</span> <input
												type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />

											<button class="btn btn-lg btn-primary btn-block"
												type="submit">Log In</button>
											<h4 class="text-center">
												<a href="registration">Create an account</a>
											</h4>
										</div>
									</form>
									<button type="submit" class="btn btn-success">Sign in</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
								</div>
							</div>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
	</div>
</div>

<!-- Header End====================================================================== -->