<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

</head>
<body>
	<s:form method="post" theme="bootstrap" cssClass="well form-vertical">

		<div class="form-group">
			<s:select list="userForm.accountList" label="Select Account"
				name="userForm.account" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" headerKey="-1" headerValue="Select Account"
				id="accNo"
				onchange="load2(this)"></s:select>
			<font color="red"><span id="accNo_span"></span></font>
		</div>

	</s:form>
</body>
</html>