
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>书籍展示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>信息列表 —— 显示所有人员信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">新增</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">显示全部人员</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <%--查询书籍--%>
            <form class="form-inline" action="${pageContext.request.contextPath}/user/queryUser" method="post" style="float: right">
                <span style="color: red;font-weight: bold">${error}</span>
                <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的人员名称">
                <input type="submit" value="查询" class="btn btn-primary">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户姓名</th>
                    <th>用户密码</th>
                    <th>用户年龄</th>
                    <th>用户性别</th>
                    <th>用户位置</th>
                    <th>&nbsp;&nbsp;操作&nbsp;&nbsp;</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${requestScope.get('list')}">
                    <tr>
                        <td>${user.getId()}</td>
                        <td>${user.getName()}</td>
                        <td>${user.getPassword()}</td>
                        <td>${user.getAge()}</td>
                        <td>${user.getSex()}</td>
                        <td>${user.getLoc()}</td>
                        <td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.getId()}">修改</a> |
<%--                        使用RestFul风格 此处直接提交ID 不用>id=${user.getId}--%>
                            <a href="${pageContext.request.contextPath}/user/deleteUser/${user.getId()}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>