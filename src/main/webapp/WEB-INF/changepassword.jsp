<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<sb:head includeScripts="false" includeScriptsValidation="false"/>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>
<script type="text/javascript">

$(function(){
	$('#submit').click(function(){
		var pwd=$('#pwd').val();
		var newPwd=$('#newPwd').val();
		var confPwd=$('#confPwd').val();
		
		var validate=true;
		if(pwd==""){
			$('#pwd_span').html("Password is required");
			validate=false;
		}
		if(newPwd==""){
			$('#newPwd_span').html("New Password is required");
			validate=false;
		}
		if(confPwd==""){
			$('#confPwd_span').html("Confirm Password is required");
			validate=false;
		}
		if(newPwd.length<6){
			$('#newPwd_span').html("Password should be atleast 6 characters");
			validate=false;
		}
		if(newPwd!=confPwd){
			$('#confPwd_span').html("Incorrect Confirm Password");
			validate=false;
		}
		return validate;
		
	});
});

</script>

</head>
<body>

<s:if test="%{#session.type=='Customer'}">
<jsp:include page="/masterpage/custheader.jsp"></jsp:include>
</s:if>
<s:else>
<jsp:include page="/masterpage/empheader.jsp"></jsp:include>
</s:else>
<br>
<div class="panel panel-success col-md-4">
  <div class="panel-heading">Change Password</div>
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
  
<s:form action="changePassword" method="post" theme="bootstrap" cssClass="well form-vertical">
<div class="form-group">
<s:password id="pwd" name="userForm.pwd" label="Current Password" errorPosition="bottom" class="form-control" placeholder="Enter Current Password"></s:password>
<font color="red"><span id="pwd_span"></span></font>
</div>
<div class="form-group">
<s:password id="newPwd" name="userForm.newPwd" label="New Password" errorPosition="bottom" class="form-control" placeholder="Enter New Password"></s:password>
<font color="red"><span id="newPwd_span"></span></font>
</div>
<div class="form-group">
<s:password id="confPwd" name="userForm.confPwd" label="Confirm Password" errorPosition="bottom" class="form-control" placeholder="Confirm Password"></s:password>
<font color="red"><span id="confPwd_span"></span></font>
</div>
<s:submit id="submit" value="Sign In" cssClass="btn btn-success"></s:submit>
</s:form>
 </div>
 
 <%-- <jsp:include page="/masterpage/footer.jsp"></jsp:include> --%>
 

</body>
<style type="text/css">

.errorMessage {
	color: red;
}

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
	margin-left: 33%;
}	
.panel-heading{
	font-size: medium;
}

.glyphicon-home{
	color: darkseagreen;
}

#change {
	background-color: darkseagreen;
	color: honeydew;
}

</style>
</html>