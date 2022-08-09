<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>院校管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<c:if test="${empty nowadmin }">
	<script type="text/javascript">
		alert("请先登录");
		window.location.href="<%=basePath%>login.jsp"; 
	</script>
</c:if>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">校园互助平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="adminIndex.jsp">管理员中心</a></li>
				<li class="layui-nav-item"><a href="admin/getusers.do">用户管理</a></li>
				<li class="layui-nav-item"><a href="admin/getschools.do">平台管理</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;">

						${nowadmin.account } </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="adminIndex.jsp">个人信息</a>
						</dd>
						<dd>
							<a href="adminPassword.jsp">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="common/logout.do">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">平台管理</a>
						<dl class="layui-nav-child">
							<dd class="layui-this">
								<a href="admin/getschools.do">院校管理</a>
							</dd>
							<dd>
								<a href="admin/gettasks.do">任务管理</a>
							</dd>
						</dl></li>
						
					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="admin/getusers.do">用户维护</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">管理员中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="adminIndex.jsp">个人信息</a>
							</dd>
							<dd>
								<a href="adminPassword.jsp">安全设置</a>
							</dd>
							<dd>
								<a href="adminAddAdmin.jsp">添加管理员</a>
							</dd>
						</dl></li>

				</ul>
			</div>
		</div>
		<!-- 内容主体区域-->
		<div class="layui-body">
			<div style="padding: 30px;" class="layui-fluid">
				<div class="layui-row">
					<div class="layui-col-md12">
						<span class="layui-badge-dot"></span> <span
							class="layui-badge-dot layui-bg-orange"></span> <span
							class="layui-badge-dot layui-bg-green"></span> <span
							class="layui-badge-dot layui-bg-cyan"></span> <span
							class="layui-badge-dot layui-bg-blue"></span> <span
							class="layui-badge-dot layui-bg-black"></span> <span
							class="layui-badge-dot layui-bg-gray"></span>
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-top: 30px;">
							<legend>院校管理</legend>
						</fieldset>
					</div>
				</div>
				
				<div class="layui-row">
					<div class="layui-col-md10">&nbsp;</div>
					<div class="layui-col-md2">
						<a onclick="addSchool()" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-radius">添加院校</a>
					</div>
				</div>
				
				<div class="layui-row">
					<div class="layui-col-md1">&nbsp;</div>
					<div class="layui-col-md10">
						<fieldset class="layui-elem-field">
							<legend>院校列表</legend>
							<c:forEach items="${list }" var="school">
								<div style="margin-left: 20px;margin-right: 30px;margin-top: 20px;">
								</div>
								<fieldset class="layui-elem-field layui-field-title"
									style="margin: 20px;margin-bottom: 5px;margin-top: 5px;">
									<legend><a>${school.name }</a></legend>
								</fieldset>
								<div style="margin-left: 20px;margin-right: 30px;">
									<c:if test="${school.state==0 }">
										<span class="layui-badge layui-bg-blue">正常</span>
									</c:if>
									<c:if test="${school.state!=0 }">
										<span class="layui-badge layui-bg-orange">被限制</span>
									</c:if>
									<span class="layui-badge layui-bg-gray">编号：${school.schoolid }</span>
									<span class="layui-badge layui-bg-gray">添加时间：<fmt:formatDate value="${school.addtime }" pattern=" yyyy-MM-dd HH:mm:ss" /></span>									
								</div>
								<div style="margin-left: 30px;margin-right: 30px;margin-top: 10px;margin-bottom: 30px;">
									<a onclick="getSchool(${school.schoolid })" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-radius">详细设置</a>
								</div>
								
							</c:forEach>
						</fieldset>

					</div>
					<div class="layui-col-md1">
						
					</div>
				</div>

			</div>

		</div>

		<c:if test="${!empty msg }">
			<script type="text/javascript">
				alert("${msg }");
			</script>
		</c:if>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			©  - 校园互助平台 17809523930
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
			//监听导航点击
			element.on('nav(test)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form,
				layer = layui.layer;
	
			//自定义验证规则
			form.verify({
				studentid : function(value) {
					if (value.length < 5) {
						return '学号至少得5个字符啊';
					}
				},
				name : function(value) {
					if (value.length < 1) {
						return '姓名至少得1个字符啊';
					}
				}
			});
	
			//监听提交
			form.on('submit(reform)', function(data) {
				layer.alert(JSON.stringify(data.field), {
					title : '最终的提交信息'
				})
			//return false;
			});
		});
	</script>
	<script>
		function getSchool(schoolidstr){
			//iframe层
			layer.open({
		      type: 2,
		      title: '该学校信息',
		      shadeClose: true,
		      shade: false,
		      area: ['1000px', '600px'],
		      content: 'admin/getschool.do?schoolidstr='+schoolidstr
		    });
		}
		function addSchool(){
			//iframe层
			layer.open({
		      type: 2,
		      title: '添加院校',
		      shadeClose: true,
		      shade: false,
		      area: ['1000px', '600px'],
		      content: 'adminSchoolAdd.jsp'
		    });
		}
	</script>
</body>
</html>
