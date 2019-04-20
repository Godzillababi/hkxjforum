<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String post_id = request.getParameter("post_id");
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
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
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="<c:url value='/index.jsp'/>">主页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<c:choose>
					<c:when test="${not empty sessionScope.session_user }">
						<ul class="nav navbar-nav">
							<li class="active">
								 <a href="<c:url value='/post.jsp'/>" data-toggle="modal">发帖</a>
							</li>						
						</ul>
					</c:when>
				</c:choose>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${empty sessionScope.session_user }">
								<li class="active">
							 		<a href="/hkxjforum/login.jsp" data-toggle="modal">登陆</a>
								</li>
							</c:when>
							<c:otherwise>								
								<li class="dropdown">
									 <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.session_user.username}<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li>
											 <a href="#">详细资料</a>
										</li>
										<li>
											 <a href="#">我的关注</a>
										</li>
										<li class="divider">
										</li>
										<li>
											 <a href="<c:url value='/user/quit'/>">退出</a>
										</li>
									</ul>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>				
			</nav>
			
			<br/><br/><br/><br/>
			
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<h3 class="text-center">
							${post.topic}
						</h3>
						<blockquote>
							<p>
								${post.content }
							</p> <p class="text-right"><small>${username}</small></p>
						</blockquote>
						<br/>
						<c:forEach items="${replyList}" var="reply" varStatus="status">
					    	<p class="text-left lead">
								 ${reply.reply_content}
								 <p class="text-right"><small>${reply.author}</small></p>
							</p>
							<br/>
					    </c:forEach>
					    <br/>						
						<p class="text-right">
							<small>浏览次数：${post.browsetimes }</small>
						</p>
					</div>
				</div>
			</div>
			
						<c:choose>
				<c:when test="${empty sessionScope.session_user }">
					<a href="<c:url value='/login.jsp'/>">登陆</a>后才可以回复
				</c:when>
				<c:otherwise>
					<c:if test="${not empty allErrors }">
						<div class="alert alert-dismissable alert-danger">
						 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<c:forEach items="${allErrors}" var="error">
		    						${ error.defaultMessage}
								</c:forEach>
						</div>					
					</c:if>
					<form role="form" action="<c:url value='/reply/sendReply?post_id='/><%=post_id%>" method="post">
						<div class="form-group">
							 <textarea class="form-control" rows="4" name="reply_content" placeholder="回复">${reply.reply_content}</textarea>
						</div>
						<button type="submit" class="btn btn-default">回复</button>
					</form>
				</c:otherwise>
			</c:choose>		
		</div>		
	</div>
</div>
  </body>
</html>
