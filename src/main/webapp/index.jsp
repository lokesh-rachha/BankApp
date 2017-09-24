<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Login</title>

<style>
.error{
	color: red;
}

.intro-login {
	right: 50%;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
}

#default {
	width: 76%;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	/* color: #f5f6f7; */
	background-color: maroon;
}

p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #1abc9c;; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: indianred; /* White */
	color: white;
}

.bg-grey {
	background-color: gainsboro;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #fff;
}

.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}

.glyphicon-chevron-up {
	color: white;
}

.navbar {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}

.navbar-nav  li a:hover {
	color: #1abc9c !important;
}

.intro {
	width: 100%;
	height: auto;
	color: white;
	height: auto;
}
</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('#submit').click(function() {
			var userId = $('#userId').val();
			var pwd = $('#pwd').val();
			var type = $('#type').val();

			var validate = true;
			if (userId == "" || userId == "0") {
				$('#userId_span').html("User ID is required");
				validate = false;
			}
			if (pwd == "") {
				$('#pwd_span').html("Password is required");
				validate = false;
			}
			if (type == "-1") {
				$('#type_span').html("Type is required");
				validate = false;
			}
			if (isNaN(userId)) {
				$('#userId_span').html("User ID should be numeric");
				validate = false;
			}
			return validate;
		});
	});
</script>

</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">

	&nbsp;&nbsp;&nbsp;&nbsp;<a href="#default"><span
		class="glyphicon glyphicon-leaf">ROYAL BANK</span></a>
	<div class="container">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#login"><span
				class="glyphicon glyphicon-log-in"></span> Login</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#about">ABOUT US</a></li>
				<li><a href="#portfolio">PORTFOLIO</a></li>
				<li><a href="#contact">CONTACT US</a></li>
			</ul>
		</div>

	</div>
	</nav>

	<!-- carousel -->
	<div class="container" id="default">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="images/loginn2.jpg" alt="Banking">
				</div>
				<div class="item">
					<img src="images/loginn1.jpg" alt="Banking" />
				</div>
				<div class="item">
					<img src="images/login1.jpg" alt="Banking" />
				</div>
				<div class="item">
					<img src="images/login4.jpg" alt="Banking" />
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>

		</div>

	</div>

	<!-- <img alt="Techlabs" src="images/login3.jpg" width="100%" id="img"/> -->
	<!-- First Container -->
	<div class="container-fluid bg-1" id="login">
		<div class="intro">
			<div class="container col-md-8">
				<div class="row">

					<div class="col-lg-6">
						<div class="intro-login">
							<br>
							<h1 align="center">Login</h1>
							<hr class="intro-divider">

							<h4>
								<s:if test="hasActionMessages()">
									<div class="actionmsg">
										<s:actionmessage />
									</div>
									<hr class="intro-divider">
								</s:if>

								<s:if test="hasActionErrors()">
									<div class="actionerr">
										<s:actionerror />
									</div>
									<hr class="intro-divider">
								</s:if>
							</h4>
							
							<small><s:form action="login" method="post"
									theme="bootstrap" cssClass="well form-vertical" class="form">

									<div class="form-group">
										<s:textfield id="userId" name="userForm.userId"
											label="UserID" errorPosition="bottom" class="form-control"
											placeholder="Enter UserID"></s:textfield>
										<font color="white"><span id="userId_span"></span></font>
									</div>
									<div class="form-group">
										<s:password id="pwd" name="userForm.pwd" label="Password"
											errorPosition="bottom" class="form-control"
											placeholder="Enter Password"></s:password>
										<font color="white"><span id="pwd_span"></span></font>
									</div>
									<div class="form-group">
										<s:select id="type" list="{'Employee','Customer'}"
											label="User Type" name="userForm.type" headerKey="-1"
											headerValue="Select Type"
											class="btn btn-default dropdown-toggle"
											data-toggle="dropdown"></s:select>
										<font color="white"><span id="type_span"></span></font>
									</div>
									<s:submit value="Sign In" cssClass="btn btn-default"
										id="submit"></s:submit>
									<br>
									<s:url action="loadForgetPasswordForm" var="urlTag"></s:url>
									<s:a action="%{urlTag}">
										<font color="white"><small>Forget Password?</small></font>
									</s:a>
								</s:form></small>

						</div>

					</div>
				</div>
			</div>
		</div>
		<br>

	</div>

	<!-- Second Container -->
	<div class="container-fluid bg-2 text-center" id="about">
		<br>
		<h3 class="margin">ABOUT US</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
			aliquip ex ea commodo consequat.</p>

	</div>
	<!-- Third Container (Grid) -->
	<div class="container-fluid bg-3 text-center" id="portfolio">
		<br>
		<h3 class="margin">PORTFOLIO</h3>
		<h4>Our Other Branches</h4>
		<br>
		<div class="row">
			<div class="col-sm-4 thumnail">
				<img src="images/newyork.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image">
				<p>
					<strong>New York</strong>
				</p>
			</div>
			<div class="col-sm-4 thumnail">
				<img src="images/paris.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image">
				<p>
					<strong>Paris</strong>
				</p>

			</div>
			<div class="col-sm-4 thumnail">
				<img src="images/sanfran.jpg" class="img-responsive margin"
					style="width: 100%" alt="Image">
				<p>
					<strong>San Francisco</strong>
				</p>
			</div>
		</div>
	</div>

	<!-- Contact -->
	<div id="contact" class="container-fluid bg-grey">
		<br>
		<h2 class="text-center">CONTACT US</h2>
		<br>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Andheri,
					Mumbai
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +91 8097709776
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					loki.rachha@gmail.com
				</p>
			</div>
			<div class="col-sm-7 slideanim">
				<!--  <div class="row">
       <div class="col-sm-6 form-group">
        
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button> 
        </div>
      </div> -->

				<s:form action="index.jsp" method="post" theme="bootstrap"
					cssClass="well form-vertical" class="form col-md-8">
					<s:textfield name="name" errorPosition="bottom"
						class="form-control" placeholder="Name"></s:textfield>
					<s:textfield name="email" errorPosition="bottom"
						class="form-control" placeholder="Email-ID"></s:textfield>
					<s:textarea name="comment" errorPosition="bottom"
						class="form-control" placeholder="Comment"></s:textarea>
					<s:submit value="Send" cssClass="btn btn-default"></s:submit>
				</s:form>
			</div>
		</div>
	</div>



	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center"> <a
		href="#default" title="To Top"> <span
		class="glyphicon glyphicon-chevron-up"></span>
	</a>

	<p>Copyright &copy 2015 Techlabs. All rights reserved</p>
	</footer>

</body>



</html>