<%@ page import="org.lanqiao.pojo.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 听音乐的酒
  Date: 2018/11/12
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>商品展示</title>
</head>
<body>

        输出标签
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
        if标签
        <c:if test="${sessionScope.username == '李沛'}" var="flag">
            欢迎您:<c:out value="${username}"></c:out>
        </c:if><br><br>
        choose标签
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
