<%-- text/html：正常的html显示  application/msword：html页面直接转word--%>
<%@ page contentType="application/msword" pageEncoding="UTF-8" language="java" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>tool</title>
        <style type="text/css">
            .bg {
            background-color: rgb(84, 127, 177);
            }

            tr {
            height: 20px;
            font-size: 12px;
            }

            .specialHeight {
            height: 40px;
            }
        </style>
    </head>
    <body>
        <div style="width:800px; margin: 0 auto">
            <c:forEach items="${table}" var="map">
                <h1>${map.key}</h1> <%--这个是类的说明--%>
                <c:forEach items="${map.value}" var="t">
                    <h3>${t.tag}</h3>   <%--这个是每个请求的说明，方便生成文档后进行整理--%>
                    <table border="1" cellspacing="0" cellpadding="0" width="100%">
                        <tr class="bg">
                            <td colspan="5"><c:out value="${t.tag}"/></td>
                        </tr>
                        <tr>
                            <td>接口描述</td>
                            <td colspan="4">${t.description}</td>
                        </tr>
                        <tr>
                            <td>URL</td>
                            <td colspan="4">${t.url}</td>
                        </tr>
                        <tr>
                            <td>请求方式</td>
                            <td colspan="4">${t.requestType}</td>
                        </tr>
                        <tr>
                            <td>请求类型</td>
                            <td colspan="4">${t.requestForm}</td>
                        </tr>
                        <tr>
                            <td>返回类型</td>
                            <td colspan="4">${t.responseForm}</td>
                        </tr>

                        <tr class="bg" align="center">
                            <td>请求参数</td>
                            <td>数据类型</td>
                            <td>参数类型</td>
                            <td>必填(Y=是,N=否)</td>
                            <td>说明</td>
                        </tr>
                        <c:forEach items="${t.requestList}" var="req">
                            <tr align="center">
                                <td>${req.name}</td>
                                <td>${req.type}</td>
                                <td>${req.paramType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${req.require == true}">Y</c:when>
                                        <c:otherwise>N</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${req.remark}</td>
                            </tr>
                        </c:forEach>
                        <tr class="bg" align="center">
                            <td>返回参数</td>
                            <td>数据类型</td>
                            <td colspan="3">描述</td>
                        </tr>

                        <c:forEach items="${t.responseList}" var="res">
                            <tr align="center">
                                <td>${res.name}</td>
                                <td>${res.remark}</td>
                                <td colspan="3">${res.description}</td>
                            </tr>
                        </c:forEach>

                        <%--<tr class="bg">
                            <td colspan="5">示例</td>
                        </tr>--%>
                        <%--<tr class="specialHeight">
                            <td class="bg">请求参数</td>
                            <td colspan="4">${t.requestParam}</td>
                        </tr>--%>
                        <%--<tr class="specialHeight">
                            <td class="bg">返回值</td>
                            <td colspan="4">${t.responseParam}</td>
                        </tr>--%>
                    </table>
                    <br>
                </c:forEach>
            </c:forEach>
        </div>
    </body>
</html>
