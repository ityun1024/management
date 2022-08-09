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

<title>信息管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<c:if test="${empty nowuser }">
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
				<li class="layui-nav-item"><a href="">任务中心</a></li>
				<li class="layui-nav-item"><a href="userIndex.jsp">个人中心</a></li>

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;">

						${nowuser.name } </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="userIndex.jsp">个人信息</a>
						</dd>
						<dd>
							<a href="userUpdate.jsp">资料修改</a>
						</dd>
						<dd>
							<a href="userPassword.jsp">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="common/logout.do">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item"><a href="">校园即时服务平台</a></li>

					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">任务管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="task/getusertask.do">已发布任务</a>
							</dd>
							<dd>
								<a href="task/getuseratask.do">已接受任务</a>
							</dd>
							<dd>
								<a href="userNewtask.jsp">发布新任务</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">个人中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="userIndex.jsp">个人信息</a>
							</dd>
							<dd class="layui-this">
								<a href="userUpdate.jsp">资料修改</a>
							</dd>
							<dd>
								<a href="userPassword.jsp">安全设置</a>
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
							<legend>资料修改</legend>
						</fieldset>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-md1">&nbsp;</div>
					<div class="layui-col-md9">
						<fieldset class="layui-elem-field">
							<legend>资料修改</legend>
							<form id="reform" class="layui-form layui-form-pane" lay-filter="formFilter"
								action="user/update.do" method="post" style="padding: 30px;">

								<input type="hidden" name="stuid" value="${nowuser.stuid }">

								<div class="layui-form-item">
									<label class="layui-form-label">学号</label>
									<div class="layui-input-inline">
										<input type="text" name="studentid" lay-verify="studentid"
											disabled="disabled" autocomplete="off" class="layui-input"
											value="${nowuser.studentid }">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">姓名</label>
									<div class="layui-input-inline">
										<input type="text" name="name" lay-verify="name"
											autocomplete="off" class="layui-input"
											value="${nowuser.name }">
									</div>
								</div>


								<div class="layui-form-item">
									<label class="layui-form-label">学校</label>
									<div class="layui-input-block">
										<select id="schoolid" name="schoolid" lay-filter="aihao">
											<option value="0" selected="">无</option>
										</select>
									</div>
								</div>

								<div class="layui-form-item" pane="">
									<label class="layui-form-label">性别</label>
									<div class="layui-input-block">
										<input type="radio" name="sex" value="0" title="男"
											<c:if test="${nowuser.sex==0 }">checked=""</c:if>> <input
											type="radio" name="sex" value="1" title="女"
											<c:if test="${nowuser.sex!=0 }">checked=""</c:if>>
									</div>
								</div>

								<div class="layui-form-item">
									<button class="layui-btn" lay-submit="reform"
										lay-filter="reform">保存</button>
								</div>
							</form>
						</fieldset>

					</div>
					<div class="layui-col-md1">&nbsp;</div>
				</div>

			</div>

		</div>

		<c:if test="${!empty msg }">
			<c:if test="${!empty flag }">
				<script type="text/javascript">
					alert("${msg }");
					window.location.href="common/logout.do"; 
				</script>
			</c:if>
			<c:if test="${empty flag }">
				<script type="text/javascript">
					alert("${msg }");
					window.location.href="common/logout.do"; 
				</script>
			</c:if>
		</c:if>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			©  - 校园互助平台办公电话：17809523930
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
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
				/*layer.alert(JSON.stringify(data.field), {
					title : '最终的提交信息'
				})*/
				//return false;
			});

		});
	</script>
	<script type="text/javascript">
	var form;
	layui.use([ 'layedit', 'form' ], function() {
		form = layui.form;
	});
	//加载layui中的jq
	layui.use([ 'jquery', 'layer' ], function() {
		var $ = layui.$, //重点处
			layer = layui.layer;

		$(function() {
			$.post(
				"common/getallschools.do",
				{},
				function(data) {
					var obj = JSON.parse(data);
					var str = "";
					for (var i = 0; i < obj.length; i++) {
						var optionStr = "";
						optionStr += "<option value='" + obj[i].schoolid + "'>" + obj[i].name + "</option>";
						$("#schoolid").append(optionStr);
						$("#schoolid").val(${nowuser.schoolid});
						form.render('select', 'formFilter');
					}
				}
			);
		});

	});
</script>
</body>
</html>
