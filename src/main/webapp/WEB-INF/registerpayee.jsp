<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Payee</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('#submit').click(function() {

			var acno = $('#acno').val();
			var pwd = $('#pwd').val();

			var validate = true;
			if (acno == "" || acno=="0") {
				$('#acno_span').html("Account No is required");
				validate = false;
			}
			if (pwd == "") {
				$('#pwd_span').html("Password is required");
				validate = false;
			}
			if(isNaN(acno)){
				$('#acno_span').html("Account No should be numeric");
				validate = false;
			}
			return validate;

		});
	});
</script>

</head>
<body>

	<jsp:include page="/masterpage/custheader.jsp"></jsp:include>
	<br>

	<div class="panel panel-info col-md-4">
		<div class="panel-heading">Register Payee</div>
		<h4><s:if test="hasActionMessages()">
			<div class="actionmsg">
				<s:actionmessage />
			</div>
		</s:if>

		<s:if test="hasActionErrors()">
			<div class="actionerr">
				<s:actionerror />
			</div>
		</s:if></h4>
		<s:form action="registerPayee" method="post" theme="bootstrap"
			cssClass="well form-vertical">

			<div class="form-group">
				<s:textfield id="acno" name="userForm.acno" label="Account No"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Account No" requiredLabel="true"></s:textfield>
				<font color="red"><span id="acno_span"></span></font>
			</div>
			<div class="form-group">
				<s:password id="pwd" name="userForm.pwd" label="Password"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Your Password" requiredLabel="true"></s:password>
				<font color="red"><span id="pwd_span"></span></font>
			</div>
			<s:submit id="submit" value="Register" cssClass="btn btn-info"></s:submit>
		</s:form>
	</div>

	<%-- <jsp:include page="/masterpage/footer.jsp"></jsp:include> --%>

</body>

<style>
.errorMessage {
	color: red;
}

a {
	font-weight: bold;
	font-size: medium;
	color: CadetBlue;
}

.hr1 {
	border-color: blue;
}

body {
	background-color: cadetblue;
}

.panel {
	margin-left: 33%;
}

.panel-heading {
	font-size: medium;
}

.glyphicon-home {
	color: cadetblue;
}

#register {
	background-color: cadetblue;
	color: honeydew;
}
</style>
</html>