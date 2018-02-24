<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Team Lead</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Bank_lock  web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web Designs" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--// Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="css/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<!-- web-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<!-- //web-fonts -->
</head>
<script type="text/javascript" src="js/onload.js"></script>

<body onload="onload()">
	<div class="header">
		<nav class="navbar navbar-default link-effect-8" id="link-effect-8">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<h1>
				<a href="index.html">Employment<span><i
						class="fa fa-credit-card-alt" aria-hidden="true"></i></span>Tracking
				</a>
			</h1>
		</div>
		<div class="top-nav-text">
			<div class="nav-contact-w3ls">
				<i class="fa fa-phone" aria-hidden="true"></i>
				<p>+0(12) 444 262 399</p>
			</div>
		</div>
		<!-- navbar-header -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="team_lead_home.jsp">Home</a></li>
				<li><a href="team_lead_view_teammembers.jsp">View Team Members</a></li>
				<li><a href="view_teammembers_performance.jsp">View Performance</a></li>
				<li><a href="tm_avg_performance.jsp">Average Performance</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>

		<div class="clearfix"></div>
		</nav>
		<%
			String sessionValue = session.getAttribute("entered_email") + "";
		%>
		<input type="hidden" name="sessionValue" id="sessionValue"
			value="<%=sessionValue%>">
	</div>
	<!-- Slider -->
	<div class="slider" id="home">
		<div class="callbacks_container">
			<ul class="rslides" id="slider">
				<li>
					<div class="w3layouts-banner-top">
						<div class="banner-dott">
							<div class="container">
								<div
									style="margin: 1cm 6cm; color: white; font-style: Sans-serif; font-size: 18px">
									Team Members Performance!!
									<%
									Performance performance = new Performance();
									ResultSet res = performance.showModulePerformance();
								%>
									<table id="customers">

										<tr>
											<th>StaffId</th>
											<th>Module Id</th>
											<th>Staff Name</th>
											<th>Performance</th>
										</tr>
										<%
											while (res.next()) {
										%>
										<tr>
											<td><%=res.getInt("staff_id")%></td>
											<td><%=res.getInt("module_id")%></td>
											<td><%=res.getString("staff_name")%></td>
											<td><%=String.format("%.2f", res.getDouble("performance"))%></td>
										</tr>
										<%
											}
										%>
									</table>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>

	</div>
	<!-- //Slider -->
	<!-- bootstrap-modal-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Bank_lock
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<!-- //bootstrap-modal-pop-up -->

	<!-- footer -->
	<div class="footer_agile_w3ls">
		<div class="container">
			<div class="agileits_w3layouts_footer_grids">
				<div class="col-md-3 footer-w3-agileits">
					<h3>Our Conditions</h3>
					<ul>
						<li>Etiam quis placerat</li>
						<li>the printing</li>
						<li>unknown printer</li>
						<li>Lorem Ipsum</li>
					</ul>
				</div>
				<div class="col-md-3 footer-agileits">
					<h3>Specialized</h3>
					<ul>
						<li>the printing</li>
						<li>Etiam quis placerat</li>
						<li>Lorem Ipsum</li>
						<li>unknown printer</li>
					</ul>
				</div>
				<div class="col-md-3 footer-wthree">
					<h3>Partners</h3>
					<ul>
						<li>unknown printer</li>
						<li>Lorem Ipsum</li>
						<li>the printing</li>
						<li>Etiam quis placerat</li>
					</ul>
				</div>

				<div class="col-md-3 footer-agileits-w3layouts">
					<h3>Our Links</h3>
					<ul>
						<li><a href="#home" class="scroll">Home</a></li>
						<li><a href="#about" class="scroll">About</a></li>
						<li><a href="#services" class="scroll">Services</a></li>
						<li><a href="#contact" class="scroll">Contact Us</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>

			</div>
		</div>
	</div>

	<!-- //footer -->
	<!-- js-scripts -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //js -->

	<!-- start-smoth-scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- start-smoth-scrolling -->

	<!-- Baneer-js -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(function() {
			$("#slider").responsiveSlides({
				auto : true,
				pager : false,
				nav : true,
				speed : 1000,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<!-- //Baneer-js -->
	<!-- js for Counter -->
	<script type="text/javascript" src="js/numscroller-1.0.js"></script>
	<!-- /js for Counter -->
	<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".center").slick({
				dots : true,
				infinite : true,
				centerMode : true,
				slidesToShow : 2,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 768,
					settings : {
						arrows : true,
						centerMode : false,
						slidesToShow : 2
					}
				}, {
					breakpoint : 480,
					settings : {
						arrows : true,
						centerMode : false,
						centerPadding : '40px',
						slidesToShow : 1
					}
				} ]
			});
		});
	</script>
	<!-- //carousal -->

	<!-- //js-scripts -->
</body>
</html>