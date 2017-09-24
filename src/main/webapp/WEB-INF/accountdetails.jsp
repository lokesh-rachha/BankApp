<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<sb:head includeScripts="false" includeScriptsValidation="" />
</head>
<body>

	<s:form action="manageCustomerAccountPost" method="post"
		theme="bootstrap" cssClass="well form-vertical">

		<div class="form-group">
		<s:textfield name="userForm.acId" label="Account ID"
			errorPosition="bottom" class="form-control" placeholder="Account ID"
			readonly="true" id="accId"></s:textfield>
			<font color="red"><span id="accId_span"></span></font>
			</div>
			
			<div class="form-group">
		<s:textfield name="userForm.balance" label="Balance"
			errorPosition="bottom" class="form-control" placeholder="Balance"
			readonly="true" id="balance"></s:textfield>
			<font color="red"><span id="balance_span"></span></font>
			</div>

	</s:form>
</body>
</html>