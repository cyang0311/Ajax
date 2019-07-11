<%--
  Created by IntelliJ IDEA.
  User: cy
  Date: 2019/7/5
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script src="https://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
      function x() {
          //创建ajax引擎对象
          var ajax ;
          var uname = document.getElementById("uname").value;
          var data = "?uname="+uname;
          if (window.XMLHttpRequest){
              ajax= new XMLHttpRequest()
          } else if(window.ActiveXObject){
              ajax = new ActiveXObject("Msxml2.XMLHTTP")
          }
          //复写onreadystatechange函数
          ajax.onreadystatechange=function(){
              var div = document.getElementById("showdiv");
              //ajax状态码
              if(ajax.readyState==4){
                  //请求响应状态码
                  if (ajax.status==200){
                      //请求内容
                      var result = ajax.responseText;
                      alert(result)
                      div.innerHTML=result;
                  }else if (ajax.status==404){
                      div.innerHTML="请求资源不存在";
                  } else if(ajax.status==500){
                      div.innerHTML="服务器繁忙";
                  }
              }else{
                  div.innerHTML="<img src=\"image/1.gif\"width=\"200px\" height=\"100px\">";
              }
          }
          //发送请求
          //get方式
          ajax.open("get","ajax1"+data);
          ajax.send(null);
          // post方式
          // ajax.open("post","ajax1");
          // ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
          // ajax.send("unane=123")
      }

    </script>
  </head>
  <body>
  <input type="text" id="uname">
  <input type="button" value="测试" name="ajax" id="ajax" onclick="x()"></input>
  <a href="ajax1">测试</a>
  <div id="showdiv" style="border: solid 1px;width: 200px;height: 100px"></div>
  </body>
</html>
