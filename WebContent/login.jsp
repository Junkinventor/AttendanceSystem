<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String info = (String)request.getAttribute("info");
	if(info == null){
		info = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎登录员工考勤系统</title>
<style type="text/css">
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<input type="hidden" id="basePath" value="<%=basePath%>"/>
<form action="LoginServlet" method="post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="147" background="images/top02.gif"></td>
	  </tr>
	</table>
	<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
	  <tr>
	    <td width="221" align="center" style="color: #7f9db9;font-size: 20px;">
	    	欢迎登录员工考勤系统
	    </td>
	  </tr>
	</table>
	<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
	  <tr>
	    <td width="221">
	    	<table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
		      <tr>
		        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
		          <tr>
		            <td align="center"><img src="images/ico13.gif" width="107" height="97" /></td>
		          </tr>
		          <tr>
		            <td height="40" align="center">&nbsp;</td>
		          </tr>
		          
		        </table></td>
		        <td><img src="images/line01.gif" width="5" height="292" /></td>
		      </tr>
	    	</table>
	    </td>
	    <td>
	    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		      	<td></td>
		      	<td style="color:red;"><%=info %></td>
		      </tr>
		      <tr>
		        <td width="31%" height="35" class="login-text02">用户名：<br /></td>
		        <td width="69%"><input name="username" id="username" type="text" size="30" /></td>
		      </tr>
		      <tr>
		        <td height="35" class="login-text02">密　码：<br /></td>
		        <td><input name="password" id="password" type="password" size="30" /></td>
		      </tr>
		      <tr>
		        <td height="35">&nbsp;</td>
		        <td><input type="submit" class="right-button01" onClick="return loginSubmit();" value="确认登陆"/>
		          <input id="secutityCodeBut" type="button" class="right-button02" value="重 置" /></td>
		      </tr>
	    	</table>
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>