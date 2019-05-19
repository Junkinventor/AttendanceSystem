<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	HttpSession hs = request.getSession();
	String content_jsp = (String)hs.getAttribute("content_jsp");
	if(content_jsp == null){
		content_jsp = "page/common/mainfra.jsp";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎登录员工考勤系统</title>
<script type="text/javascript">  

</script>
</head>
<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
	<noframes>
		<body>
			<input type="hidden" value="<%=content_jsp %>"/>
			很抱歉，您使用的浏览器不支持框架功能，请转用新的浏览器。
		</body>
	</noframes>
    <frame src="page/common/top.jsp" name="topFrame" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
      <frame src="page/common/left.jsp" name="leftFrame" noresize="noresize" id="leftFrame" title="leftFrame" />
      <frame src="<%=basePath %><%=content_jsp %>" name="mainFrame" id="mainFrame" title="mainFrame" />
    </frameset>
</frameset>
</html>
