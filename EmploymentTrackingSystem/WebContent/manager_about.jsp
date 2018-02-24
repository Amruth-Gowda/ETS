<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Manger</title>
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
				<li><a href="manager_home.jsp">Home</a></li>
				<li><a href="manager_add_project.jsp">Create Project</a></li>
				<li><a href="manager_view_project.jsp">View Projects</a></li>
				<li><a href="manager_view_teamlead.jsp">View Team Leads</a></li>
				<li><a href="manager_view_team_members.jsp">View Team Members</a></li>
				<li><a href="manager_asssign_project.jsp">Assign Project</a></li>
				<li><a href="manager_about.jsp">About</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>

		<div class="clearfix"></div>
		</nav>
<%
String sessionValue = session.getAttribute("entered_email")+"";
%>
<input type="hidden" name ="sessionValue" id ="sessionValue" value="<%=sessionValue %>">
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
									style="margin: 1cm 9cm; color: white; font-style: Sans-serif; font-size: 18px">
									Manger About!!!!
									<jsp:useBean id="staffobj" class="com.model.Staff"></jsp:useBean>
									<%
										String email = session.getAttribute("entered_email").toString();
										ResultSet result = staffobj.getStaffDetailsName(email);
										if (result.next()) {
									%>
									<table id="customers">

										<tr>
											<th>Id:</th>
											<td><%=result.getString("staff_id")%></td>
										</tr>
										<tr>
											<th>Name:</th>
											<td><%=result.getString("staff_name")%></td>
										</tr>
										<tr>
											<th>Gender:</th>
											<td><%=result.getString("staff_gender")%></td>
										</tr>
										<tr>
											<th>Date Of Birth:</th>
											<td><%=result.getString("staff_dob")%></td>
										</tr>
										<tr>
											<th>Email:</th>
											<td><%=result.getString("staff_email")%></td>
										</tr>
										<tr>
											<th>Password:</th>
											<td><%=result.getString("staff_password")%></td>
										</tr>
										<tr>
											<th>Mobile Number:</th>
											<td><%=result.getString("staff_mobile_number")%></td>
										</tr>
										<tr>
											<th>Address:</th>
											<td><%=result.getString("staff_address")%></td>
										</tr>
										<tr>
											<th>Designation:</th>
											<td><%=result.getString("staff_designation")%></td>
										</tr>
									</table>
									<%
										}
									%>
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