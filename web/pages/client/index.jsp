<%--
  Created by IntelliJ IDEA.
  User: 96295
  Date: 2021/12/22
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>商城首页</title>
    <style>
        *{
            margin: auto;
            padding: 0;
        }
        ul{
            list-style:none;
        }
        .slideShow{
            width: 850px;
            height: 400px;     /*其实就是图片的高度*/
            border: 1px #eeeeee solid;
            margin: 10px auto;
            position: relative;
            overflow: hidden;    /*此处需要将溢出框架的图片部分隐藏*/
        }
        .slideShow ul{
            width: 3400px;
            position: relative;     /*此处需注意relative : 对象不可层叠，但将依据left，right，top，bottom等属性在正常文档流中偏移位置，如果没有这个属性，图片将不可左右移动*/
        }
        .slideShow ul li{
            float: left;     /*让四张图片左浮动，形成并排的横着布局，方便点击按钮时的左移动*/
            width: 850px;   /*要和 .slideShow{width: 700px;  一致*/
        }
        .slideShow .showNav{     /*用绝对定位给数字按钮进行布局*/
            position: absolute;
            right: 10px;
            bottom: 5px;
            text-align:center;
            font-size: 12px;
            line-height: 20px;
        }
        .slideShow .showNav span{
            cursor: pointer;
            display: block;
            float: left;
            width: 20px;
            height: 20px;
            background: #ff5a28;
            margin-left: 2px;
            color: #fff;
        }
        .slideShow .showNav .active{
            background: #b63e1a;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            border-spacing: 15px;
        }
        td{
            background-color: white;
            height: 200px;
            width: 150px;
        }
    </style>
    <script type="text/javascript" src="../../static/script/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var slideShow=$(".slideShow"),                                   //获取最外层框架的名称
                ul=slideShow.find("ul"),
                showNumber=slideShow.find(".showNav span"),                  //获取按钮
                oneWidth=slideShow.find("ul li").eq(0).width();              //获取每个图片的宽度
            var timer=null;                                                  //定时器返回值，主要用于关闭定时器
            var iNow=0;                                                      //iNow为正在展示的图片索引值，当用户打开网页时首先显示第一张图，即索引值为0
            showNumber.on("click",function(){                                //为每个按钮绑定一个点击事件
                $(this).addClass("active").siblings().removeClass("active"); //按钮点击时为这个按钮添加高亮状态，并且将其他按钮高亮状态去掉
                var index=$(this).index();                                   //获取哪个按钮被点击，也就是找到被点击按钮的索引值
                iNow=index;
                ul.animate({    "left":-oneWidth*iNow,                       //注意此处用到left属性，所以ul的样式里面需要设置position: relative; 让ul左移N个图片大小的宽度，N根据被点击的按钮索引值iNOWx确定
                })
            });
            function autoplay(){
                timer=setInterval(function(){                 //打开定时器
                    iNow++;                                   //让图片的索引值次序加1，这样就可以实现顺序轮播图片
                    if(iNow>showNumber.length-1){             //当到达最后一张图的时候，让iNow赋值为第一张图的索引值，轮播效果跳转到第一张图重新开始
                        iNow=0; }
                    showNumber.eq(iNow).trigger("click");     //模拟触发数字按钮的click
                },2000);                                      //2000为轮播的时间
            }
            autoplay();
            slideShow.hover( function(){clearInterval(timer);},autoplay);     //另外注意setInterval的用法比较关键。

        })
        function clickGoods(id){
            // $.ajax({
            //     url:"http://localhost:8080/ShopSystem/goodsImfoServlet",
            //     type:"get",
            //     data:"goodsid="+id,
            //     success:function (){},
            //     dataType:"text"
            // });
            // window.location.href = "pages/client/goodsImformation.jsp"
             window.location.href="goodsImfoServlet?goodsid="+id;
            // location.href="http://localhost:8080/ShopSystem/goodsImfoServlet";
        }
    </script>
</head>
<body style="background-color: #eeeeee">

<%@include file="../common/header.jsp"%>
<div class="slideShow">
    <!--图片布局开始-->
    <ul>
        <li><a href="https://pro.jd.com/mall/active/3fNa4gg4udob1juiWbWWBp9z9PBs/index.html"><img src="static/img/01.jpg" /></a></li>
        <li><a href="https://pro.jd.com/mall/active/4CbNduaE946DLsfz59RSkiu1FVUy/index.html"><img  src="static/img/02.jpg" /></a></li>
        <li><a href="https://pro.jd.com/mall/active/3EL7UxWWL48i9BfubvrLLuX3w7hm/index.html?babelChannel=ttt46"><img src="static/img/03.jpg" /></a></li>
        <li><a href="https://item.jd.com/100022067320.html"><img  src="static/img/04.jpg" /></a></li>
    </ul>
    <!--图片布局结束-->

    <!--按钮布局开始-->
    <div class="showNav">
        <span class="active">1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
    </div>
    <!--按钮布局结束-->
</div>

<table align="center">
    <tr>
        <td align="center">
            <div id="1_1">
                <img src="static/img/goods_01.png" width="150" height="190" style="cursor:pointer" onclick="clickGoods(1.1)"><br>
                <div style="cursor:pointer" onclick="clickGoods()">电脑</div>
            </div>
        </td>
        <td align="center">
            <div id="1_2">
                <img src="static/img/goods_02.png" width="150" height="190" style="cursor:pointer" onclick="clickGoods(1.2)"><br>
                <div style="cursor:pointer" onclick="clickGoods()">xxxx</div>
            </div>
        </td>
        <td align="center">
            <div id="1_3">
                <img src="static/img/goods_03.png" width="150" height="190" style="cursor:pointer" onclick="clickGoods(1.3)"><br>
                <div style="cursor:pointer" onclick="clickGoods()">xxxx</div>
            </div>
        </td>
        <td align="center">
            <div id="1_4">
                <img src="static/img/goods_04.png" width="150" height="190" style="cursor:pointer" onclick="clickGoods(1.4)"><br>
                <div style="cursor:pointer" onclick="clickGoods()">xxxx</div>
            </div>
        </td>
        <td align="center">
            <div id="1_5">
                <img src="static/img/goods_05.png" width="150" height="190" style="cursor:pointer" onclick="clickGoods(1.5)"><br>
                <div style="cursor:pointer" onclick="clickGoods()">xxxx</div>
            </div>
        </td>
    </tr>
    <tr>
        <td align="center"><img src="#"><br>xxxx</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td align="center"><img src="#"><br>xxxx</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>
<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>
