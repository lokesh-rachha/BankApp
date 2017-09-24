<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Locked</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

</head>
<body>

	<div class="jumbotron text-center">
		<h1>
			<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
			Your Account is Locked...
		</h1>
		<p>Contact customer care : 1800-1800-1800 to Unlock Your Account.</p>
		<p>
			<a href="index"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
			Click here to Login</a>
		</p>
	</div>

</body>

<style type="text/css">
h1 {
	font-weight: bold;
	font-size: x-large;
	/* color: honeydew; */
}

a {
	font-weight: bold;
	font-size: x-large;
	color: DarkCyan ;
}

.jumbotron {
	background-color: honeydew;
	color: DarkCyan ;
	padding: 100px 100px;
}

body {
	background-color: DarkCyan ;
}
</style>

</html>