<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money</title>
<sb:head includeScripts="false" includeScriptsValidation="false"/>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
</script>

<script>
$(function(){
	$('#submit').click(function(){
		
		var accountId = $('#accountId').val();
		var payeeId = $('#payeeId').val();
		var amount = $('#amount').val();
		var balance = $('#balance').val();
		var pwd = $('#pwd').val();
		
		var validate=true;
		if(accountId=="-1"){
			$('#accountId_span').html("Your's Account No is required");
			validate=false;
		}
		if(payeeId=="-1"){
			$('#payeeId_span').html("Payee's Account No is required");
			validate=false;
		}
		if(amount=="" || amount=="0.0"){
			$('#amount_span').html("Amount is required");
			validate=false;
		}
		if(pwd==""){
			$('#pwd_span').html("Password is required");
			validate=false;
		}
		if(isNaN(amount)){
			$('#amount_span').html("Amount should be numeric");
			validate=false;
		}
		
		return validate;
		
	});
	
	$('#accountId').change(function(){
		var accid = $('#accountId').val();
		if (accid != -1) {
			loadDoc(accid)
		}
		else{
			$('#response').html("");
		}
	});
});

function loadDoc(accid) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("response").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "loadAccountDetails?accNo=" + accid, true);
	xhttp.send();
}
</script>

</head>

<body>

<jsp:include page="/masterpage/custheader.jsp"></jsp:include>
<br>
<div class="panel panel-warning col-md-4">
  <div class="panel-heading">Transfer Money</div>
  
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
		
  <s:form action="transferMoney" method="post" theme="bootstrap" cssClass="well form-vertical">
 <div class="form-group"> 
<s:select id="accountId" label="Select Account" 
		headerKey="-1" headerValue="Select Account"
		list="userForm.custAccNo" 
		name="userForm.account" requiredLabel="true"/>
		<font color="red"><span id="accountId_span"></span></font>
		</div>
		
  <div id="response"></div>
  
  <div class="form-group">
 <s:select id="payeeId" label="Select Payee" 
		headerKey="-1" headerValue="Select Account"
		list="userForm.payeeAccNo" 
		name="userForm.payee" requiredLabel="true"/>
		<font color="red"><span id="payeeId_span"></span></font>
	</div>
	
	<div class="form-group">	
<s:textfield id="amount" name="userForm.amount" label="Amount" errorPosition="bottom" class="form-control" placeholder="Enter Amount" requiredLabel="true"></s:textfield>
<font color="red"><span id="amount_span"></span></font>
</div>

<div class="form-group">	
<s:password id="pwd" name="userForm.pwd" label="Password" errorPosition="bottom" class="form-control" placeholder="Enter Password" requiredLabel="true"></s:password>
<font color="red"><span id="pwd_span"></span></font>
</div>

<s:submit id="submit" value="Transfer" cssClass="btn btn-warning"></s:submit>

</s:form>
 </div>
</body>
<style>
.errorMessage{
	color: red;
}
a{
	font-weight: bold;
	font-size:medium;
	color: BurlyWood;
}
 .hr1{
	border-color: BurlyWood;
	} 
body{
	background-color: BurlyWood;
}
.panel{
	margin-left: 33%;
}	
.panel-heading{
	font-size: medium;
}
.glyphicon-home{
	color: BurlyWood;
}

#transfer {
	background-color: BurlyWood;
	color: honeydew;
</style>
</html>