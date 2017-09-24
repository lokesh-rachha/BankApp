<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('#submit').click(function() {
			
			var userId = $('#userId').val();
			var email = $('#email').val();
			var mobile = $('#mobile').val();

			var validate = true;
			if (userId == "" || userId == "0") {
				$('#userId_span').html("User ID is required");
				validate = false;
			}
			if (email == "") {
				$('#email_span').html("Email ID is required");
				validate = false;
			}
			if (mobile == "") {
				$('#mobile_span').html("Mobile No is required");
				validate = false;
			}
			if (isNaN(userId)) {
				$('#userId_span').html("User ID should be numeric");
				validate = false;
			}
			if (isNaN(mobile)) {
				$('#mobile_span').html("Mobile No should be numeric");
				validate = false;
			}
			return validate;
		});
	});
</script>

</head>
<body>

	<div class="jumbotron text-center">
		<p>
			<a href="index"><span class="glyphicon glyphicon-log-in"
				aria-hidden="true"></span> Click here to Login</a>
		</p>
	</div>

	<div class="panel panel-warning col-md-4">
		<div class="panel-heading">Forget Password</div>
		<h4>
			<s:if test="hasActionMessages()">
				<div class="actionmsg">
					<s:actionmessage />
				</div>
			</s:if>

			<s:if test="hasActionErrors()">
				<div class="actionerr">
					<s:actionerror />
				</div>
			</s:if>
		</h4>

		<s:form action="forgetPassword" method="post" theme="bootstrap"
			cssClass="well form-vertical">

			<div class="form-group">
				<s:textfield id="userId" name="userForm.userId"
					label="User ID" errorPosition="bottom" class="form-control"
					placeholder="Enter User ID"></s:textfield>
				<font color="red"><span id="userId_span"></span></font>
			</div>

			<div class="form-group">
				<s:textfield id="email" name="userForm.email" label="Email ID"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Registered Email ID"></s:textfield>
				<font color="red"><span id="email_span"></span></font>
			</div>

			<div class="form-group">
				<s:textfield id="mobile" name="userForm.mobile"
					label="Mobile No" errorPosition="bottom" class="form-control"
					placeholder="Enter Registered Mobile No"></s:textfield>
				<font color="red"><span id="mobile_span"></span></font>
			</div>

			<s:submit id="submit" value="Get Password" cssClass="btn btn-warning"></s:submit>
		</s:form>
	</div>

</body>

<style type="text/css">
.errorMessage {
	color: red;
}

body {
	background-color: orangered;
}

.panel {
	margin-left: 33%;
}

.panel-heading {
	font-size: medium;
}

a {
	font-weight: bold;
	font-size: x-large;
	color: orangered;
}

.jumbotron {
	background-color: honeydew;
	color: orangered;
}
</style>

</html>