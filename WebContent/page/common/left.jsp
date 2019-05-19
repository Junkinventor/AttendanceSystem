<%@page import="com.attendancesystem.constant.Constant"%>
<%@page import="com.attendancesystem.vo.Resource"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.attendancesystem.vo.Permission"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.attendancesystem.vo.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession hs = request.getSession();
	List<Permission> plist = (List)hs.getAttribute("permission");
	List<Resource> rlist = (List)hs.getAttribute("resource");
	User user = (User) session.getAttribute("sysUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎登录员工考勤系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../../images/left.gif);
}
-->
</style>
<link href="../../css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="../../images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="../../images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="../../images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="../../images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="../../images/ico04.gif";
	}
}

</script>

<body>
<input type="hidden" id="basePath" value="<%=basePath%>"/>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="../../images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="../../images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02"><a class="left-font01" href="javascript:;"><%=hs.getAttribute("useralias") %></a></span></td>
					<!-- <td width="75%" height="22" class="left-font01">您好，<span class="left-font02"><a class="left-font01" href="<%=basePath%>PersonalInfoServlet?ptype=<%=Constant.PERSONAL_INFO %>&uid=<%=user.getUserid() %>"><%=hs.getAttribute("useralias") %></a></span></td> -->
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="<%=basePath%>SignOutServlet" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		<!--  菜单导航开始    -->
		<c:forEach items="<%=plist %>" var="operate" varStatus="optStat">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img<c:out value="${operate.id}"/>" id="img<c:out value="${operate.id}"/>" src="../../images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('<c:out value="${operate.id}"/>');" >${operate.name }</a>
							</td>
						</tr>
					</table>
				</td>
	          </tr>
	        </table>
	        <c:forEach items="<%=rlist %>" var="operateSub" varStatus="optSubStat">
	        	<c:if test="${operateSub.pid == operate.pid }">
					<table id="subtree<c:out value="${operate.id}"/>" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
							cellspacing="0" class="left-table02">
							<tr>
							  <td width="9%" height="20" ><img id="xiaotu20" src="../../images/ico06.gif" width="8" height="12" /></td>
							  <td width="91%"><a href="<c:url value="${operateSub.url}"/>" target="mainFrame" class="left-font03" onClick="tupian('20');">${operateSub.name}</a></td>
							</tr>
			      	</table>
	        	</c:if>
	        </c:forEach>
		</c:forEach>
		<!--  菜单导航结束    -->
	  </td>
  </tr>
  
</table>
</body>
</html>
