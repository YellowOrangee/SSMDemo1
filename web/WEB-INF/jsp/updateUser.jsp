<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>修改信息</title>
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
          <small>修改信息</small>
        </h1>
      </div>
    </div>
  </div>

  <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
<%--    因为SQL语句中需要一个ID,所以从前端通过隐藏域传回被修改的书籍的ID进行查询,否则SQL语句无法正常执行--%>
    <input type="hidden" name="id" value="${userA.getId()}"/><br><br><br>
    Name：<input type="text" name="name" value="${userA.getName()}"/><br><br><br>
    Password：<input type="text" name="password" value="${userA.getPassword()}"/><br><br><br>
    Age：<input type="text" name="age" value="${userA.getAge() }"/><br><br><br>
    Sex：<input type="text" name="sex" value="${userA.getSex() }"/><br><br><br>
    Loc：<input type="text" name="loc" value="${userA.getLoc() }"/><br><br><br>
    <input type="submit" value="提交"/><br><br><br>
  </form>

</div>