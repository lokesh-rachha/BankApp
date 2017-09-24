<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<sb:head includeScripts="false" includeScriptsValidation="false"/>
</head>
<body>
<s:form method="post" theme="bootstrap" cssClass="well form-vertical">
<s:textfield id="account" name="userForm.acId" label="Account ID" errorPosition="bottom" class="form-control" disabled="true"></s:textfield>
<s:textfield id="balance" name="userForm.balance" label="Balance" errorPosition="bottom" class="form-control" disabled="true"></s:textfield>
</s:form>
</body>
</html>