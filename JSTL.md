##JSTL

EL表达式 和 JSTL 结合，一起解决jsp页面中，大量Java代码(JSP片段)的问题

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\59.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\60.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\61.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\62.png)

### JSTL的使用

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\63.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\64.png)

### JSTL核心标签库

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\65.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\66.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\67.png)

#### 选择标签

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\68.png)

#### 循环标签

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\69.png)

goodsServlet类

```java
@WebServlet("/goodsServlet")
public class goodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         goodsService goodsService =  new goodsServiceImpl();

        //获取商品列表
        List<Goods> goodsList = goodsService.findAllGoods();
        Goods goods = goodsService.findOneGoods(1);//获取一个商品信息
        //将商品列表存放到request中
        request.setAttribute("goodsList",goodsList);
        request.setAttribute("goods",goods);//将商品存放到request中
        request.getRequestDispatcher("/JSTL.jsp").forward(request,response);
    }
}

```

JSTL.jsp

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品展示</title>
</head>
<body>

        <%--输出标签--%>
        你好:<c:out value="Hello JSTL"></c:out><br>
        <c:set var="test" value="test的值"></c:set>
        ${test}<br>
        <c:out value="${test}"></c:out><br><br>
        <%--................................................................--%>

        <%
            //商品信息列表
            List<Goods> goodsList = (List<Goods>)request.getAttribute("goodsList");
            String username = "李沛";
            session.setAttribute("username",username);
            String sex = "1";
            request.setAttribute("sex",sex);
        %>
        <%--选择标签  test:为判断条件--%>
        <%--if标签--%>
        <c:if test="${sessionScope.username == '李沛'}" var="flag">
            欢迎您:<c:out value="${username}"></c:out>
        </c:if><br><br>
        <%--choose标签--%>
        <c:choose>
            <c:when test="${requestScope.sex == 1}">
                男
            </c:when>
            <c:when test="${requestScope.sex == 2}">
                女
            </c:when>
            <c:otherwise>
                性别未知
            </c:otherwise>
        </c:choose><br><br>
        <h3>商品列表信息</h3>
        <%--循环标签--%>
        <c:forEach items="${requestScope.goodsList}" begin="0" step="2" end="4" var="str">
            ${str}
        </c:forEach><br><br>
    	<%--格式化标签--%>
        <%
            Date date = new Date();
            request.setAttribute("date",date);
        %>
        <fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate><br>
         <%--数字格式化--%>
         <fmt:formatNumber value="1233" type="currency" pattern="$.00"></fmt:formatNumber><br>
        <fmt:formatNumber value="1233.9999"  pattern="#,#00.0#"></fmt:formatNumber><br><br>
        <%--函数标签库--%>
        ${fn:toLowerCase("AAAAAAAAAAAA")}

</body>
</html>
```

### 格式化标签

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\70.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\71.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\72.png)

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\73.png)

### Functions标签库

![](C:\Users\听音乐的酒\Desktop\笔记\学习笔记\imgs1\74.png)

当当