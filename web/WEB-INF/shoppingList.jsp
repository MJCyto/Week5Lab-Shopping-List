<%-- 
    Document   : shoppingList
    Created on : 8-Oct-2019, 2:08:17 PM
    Author     : mjjmk
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>

        Hello, ${user}
        <a href="<c:url value='/ShoppingList'>
               <c:param name='action' value='logout'></c:param>
            </c:url>">Logout</a>

        <h2>List</h2>

        <form action="ShoppingList" method="post">
            Add item: <input type="text" name="itemName">
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add">
        </form>
        
        <form action="ShoppingList" method="post">
           <table>
            <c:forEach items="${list}" var="item">
                <tr>
                    <td><input type="radio" name="listItem" value="${item}"></td>
                    <td>${item}</td>
                </tr>
            </c:forEach>
            </table> 
            <input type="hidden" name="action" value="delete">
            <input type="submit" value="Delete">
        </form>
        
        
        <!--<form>-->

            <!---->
        <!--</form>-->


    </body>
</html>
