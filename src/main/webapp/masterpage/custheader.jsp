<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<sb:head includeScripts="false" includeScriptsValidation="false"/>
<style>
.navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
  }
  
</style>
<body>
<nav class="navbar navbar-default navbar-static-top">
  <div class="container-fluid">
   <div class="navbar-header">
   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="customerHome"><span class="glyphicon glyphicon-home"></span></a>
   </div>
   <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav nav-pills navbar-right">
        <li>
        	<s:url action="customerHome" var="urlTag" ></s:url>
         <s:a href="%{urlTag}" id="home">Home</s:a> 
        </li>
        <li>
        	<s:url action="loadRegisterPayeeForm" var="urlTag"></s:url>
         <s:a href="%{urlTag}" id="register">Register Payee</s:a> 
        </li>
        <li>
         <s:url action="loadTransferMoneyForm" var="urlTag"></s:url>
         <s:a href="%{urlTag}" id="transfer">Transfer Money</s:a> 
        </li> 
        <li>
        <s:url action="loadUpdateProfileForm" var="urlTag"></s:url>
         <s:a href="%{urlTag}" id="update">Update Profile</s:a> 
        </li>
        <li>
         <s:url action="loadChangePasswordForm" var="urlTag"></s:url>
         <s:a href="%{urlTag}" id="change">Change Password</s:a> 
        </li>
        <li>
        <s:url action="logout" var="urlTag"></s:url>
        <s:a href="%{urlTag}"><span class="glyphicon glyphicon-log-out"></span> Logout</s:a></li> 
      </ul>
    </div>
 </div>
  <hr class="hr1">
</nav>
