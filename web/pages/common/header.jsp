<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/23
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath=request.getScheme()+"://"		//获取请求使用的协议名（http或https）
            +request.getServerName()+":"				//获取请求url上的主机名
            +request.getServerPort()+path+"/";			//获取请求url上的端口号		//获取请求项目的根路径
%>
<html>
<head>
    <title></title>
    <base href="<%=basePath%>"/>
    <style>
        *{
            margin: auto;
        }
        .menu{
            width: 1400px;
            height: 30px;     /*其实就是图片的高度*/
            /*border: 1px #eeeeee solid;*/
            margin: 10px auto;
            position: relative;
            list-style:none;
        }
        .menu li {
            list-style:none; /* 将默认的列表符号去掉 */
            padding:0; /* 将默认的内边距去掉 */
            margin:0; /* 将默认的外边距去掉 */
            float: left; /* 往左浮动 */
            display: block
        }
        .menu li a {
            display:inline-block; /* 将链接设为块级元素 */
            width:200px; /* 设置宽度 */
            height:30px; /* 设置高度 */
            line-height:30px; /* 设置行高，将行高和高度设置同一个值，可以让单行文本垂直居中 */
            text-align:center; /* 居中对齐文字 */
            background: darkseagreen; /* 设置背景色 */
            color:#fff; /* 设置文字颜色 */
            text-decoration:none; /* 去掉下划线 */
            border-right:1px solid #000; /* 在左侧加上分隔线 */
        }
        .menu li a:hover {
            background: cadetblue; /* 变换背景色 */
            color:#fff; /* 变换文字颜色 */
        }
        .menu li a.last {
            border-right:0; /* 去掉左侧边框 */
        }
        .menu li div.first {
            display:inline-block; /* 将链接设为块级元素 */
            width:200px; /* 设置宽度 */
            height:30px; /* 设置高度 */
            background: none; /* 设置背景色 */
            border-right: 0;
        }
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        $(function (){
            var name = "<%=request.getSession().getAttribute("user")%>";
            if(name!="null"){
                $("#imfo").html("<a style=\"text-decoration:none; font-size: 20px\" href=\"pages/user/personalCenter.jsp\">"+name+" </a>");
            }else{
                $("#imfo").html("<a style=\"text-decoration:none; font-size: 20px\" href=\"pages/user/login.jsp\">登录/</a>\n" +
                    "<a style=\"text-decoration:none; font-size: 20px\" href=\"pages/user/register.jsp\">注册</a>");
            }
        });
    </script>
</head>
<body>
<ul class="menu">
    <li><div class="first"></div></li><%-- 右边会多出一个，为了对称，左边加一个--%>
    <li><a href="pages/client/index.jsp">首页</a></li>
    <li><a href="#">家用电器</a> </li>
    <li><a href="#">手机数码</a> </li>
    <li><a href="#">男装/女装</a> </li>
    <li><a href="#" class="last">家居家装</a> </li>
    <div id="imfo"></div>
<%--    <a id="login" style="text-decoration:none; font-size: 20px" href="pages/user/login.jsp">登录/</a>--%>
<%--    <a id="register" style="text-decoration:none; font-size: 20px" href="pages/user/register.jsp">注册</a>--%>
<%--    <a id="user" style="text-decoration:none; font-size: 20px" href="pages/user/personalCenter.jsp"><%=request.getSession().getAttribute("user")%></a>--%>
</ul>
</body>
</html>