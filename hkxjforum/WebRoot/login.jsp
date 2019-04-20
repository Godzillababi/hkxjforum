<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">登陆</h3>
			<c:choose>
				<c:when test="${not empty error_message}">
					<div class="alert alert-dismissable alert-danger">
						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						${error_message}
					</div>
				</c:when>
			</c:choose>
			<c:forEach items="${allErrors}" var="error">
		    	${error.defaultMessage}
			</c:forEach>
			<form class="form-horizontal" role="form" action="<c:url value='/user/login'/>" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学号</label>
					<div class="col-sm-10">
						<input type="text" placeholder="学号" onkeyup="this.value=this.value.replace(/\D/gi,'')" class="form-control" id="inputEmail3" name="account" value="${user.account}" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" placeholder="密码" class="form-control" id="inputPassword3" name="password" value="${user.password}" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 text-center">
						 <button type="submit" class="btn btn-default">登陆</button>
					</div>
				</div>
			</form>
			<div class="text-center">
				<a href="<c:url value='/index.jsp'/>">游客身份进入</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
