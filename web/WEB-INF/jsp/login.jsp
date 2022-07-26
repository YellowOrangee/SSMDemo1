<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>ajax</title>

  <script src="../static/js/jquery-3.6.0.min.js"></script>
  <script >
    function a1(){
      $.post({
        url:"${pageContext.request.contextPath}/a3",
        data:{'name':$("#name").val()},
        success:function (data) {
          if (data.toString()=='OK'){
            $("#userInfo").css("color","green");
          }else {
            $("#userInfo").css("color","red");
          }
          $("#userInfo").html(data);
        }
      });
    }
    function a2(){
      $.post({
        url:"${pageContext.request.contextPath}/a3",
        data:{'password':$("#password").val()},
        success:function (data) {
          if (data.toString()=='OK'){
            $("#pwdInfo").css("color","green");
          }else {
            $("#pwdInfo").css("color","red");
          }
          $("#pwdInfo").html(data);
        }
      });
    }

  </script>
</head>
<body>
<%--<form action="${pageContext.request.contextPath}/user/login" method="post">--%>
<%--    用户名:<input type=text id="name" name="=name" onblur="a1()"><br>--%>
<%--    <span id="userInfo"></span><br>--%>
<%--    &nbsp;密码:<input  type=text id="password" name="=password" onblur="a2()">--%>
<%--    <span id="pwdInfo"></span><br>--%>
<%--    <input type="submit" value="登录">--%>


<%--</form>--%>

<form action="${pageContext.request.contextPath}/user/login" method="post">
    用户名:<input type=text id="name" name="=name" ><br>
    &nbsp;密码:<input  type=text id="password" name="=password"><br>
    <input type="submit" value="登录">


</form>
</body>
</html>
