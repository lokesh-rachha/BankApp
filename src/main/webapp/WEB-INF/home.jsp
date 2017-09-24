<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<sb:head includeScripts="false" includeScriptsValidation="false"/>

</head>

<%
	int count=0;
%>

<jsp:include page="/masterpage/custheader.jsp"></jsp:include>
<br>

<div class="container">
<div class="row">
<div class="span4 offset2">
<div class="panel panel-success col-md-6">
  <div class="panel-heading">Account Details</div>
  <table class="table table-responsive">
  <tr>
  <th>#</th>
  <th>Account No</th>
  <th>Name</th>
  <th>Balance</th>
  </tr>
  <s:iterator value="userForm.accountDetails">
  <tr>
  <td><span class="badge"><%=count+1 %></span></td>
  <td><s:property value="accId"/></td>
  <td><s:property value="customer.name"/></td>
  <td><s:property value="balance"/></td>
  </tr>
  </s:iterator>
  </table>
 </div>
 </div>
 </div>
 </div>
 
 <%-- <jsp:include page="/masterpage/footer.jsp"></jsp:include> --%>
 
 </body>
 
 
<style type="text/css">

a{
	font-weight: bold;
	font-size:medium;
	color: green;
}
 .hr1{
	border-color: green;
	} 
body{
	background-color: darkseagreen;
}
.panel{
	margin-left: 23%;
}	
.panel-heading{
	font-size: medium;
}

.glyphicon-home{
	color: darkseagreen;
}

#home {
	background-color: darkseagreen;
	color: honeydew;
}

</style>
</html>
