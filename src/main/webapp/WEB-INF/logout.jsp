<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

</head>
<body>

	<div class="jumbotron text-center">
		<h1>
			<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Successfully Logged Out...
		</h1>
		<p>
			<a href="index"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> Click here to Login</a>
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
	color: maroon;
}

.jumbotron {
	background-color: honeydew;
	color: maroon;
	padding: 100px 100px;
}

body {
	background-color: maroon;
}
</style>
</html>