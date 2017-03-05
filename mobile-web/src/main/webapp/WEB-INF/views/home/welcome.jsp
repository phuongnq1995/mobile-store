<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<div class="span9">
	<div class="well well-small">
		<h4>
			Featured Products <small class="pull-right">200+ featured
				products</small>
		</h4>
		<div class="row-fluid">
			<div id="featured" class="carousel slide">
				<div class="carousel-inner">
					<div class="item active">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<a href="product_details.html"><img
										src="themes/images/products/1.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="product_details.html">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="item">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<a href="product_details.html"><img
										src="themes/images/products/2.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="product_details.html">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
				<a class="right carousel-control" href="#featured" data-slide="next">›</a>
			</div>
		</div>
	</div>
	<h4>New Products</h4>
	<c:forEach var="product" items="${products}">
		<ul class="thumbnails">
			<li class="span3">
				<div class="thumbnail">
					<a href="product_details.html"><img
						src="${pageContext.request.contextPath}/imageShow/${product.getImages().get(0).getId()}"
						alt="" /></a>
					<div class="caption">
						<h5>${product.name}</h5>
						<p>${product.description}</p>
						<h4 style="text-align: center">
							<a class="btn" href="#"><i class="fa fa-search-plus" style="font-size:20px"></i></a>
							<a class="btn" href="#" style="font-size: 15px">Add to <i class="fa fa-shopping-cart"
								style="font-size: 20px"></i></a> <a class="btn btn-primary" href="#">$${product.getCurrentPrice().money}.00	</a>
						</h4>
					</div>
				</div>
			</li>
		</ul>

	</c:forEach>

</div>
