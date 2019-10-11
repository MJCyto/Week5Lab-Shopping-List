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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shopping List</h1>

        Hello, ${user.getName}
        <a href="ShoppingList?logout">Logout</a>

        <h2>List</h2>

        <form>
            Add item: <input type="text" name="itemName">
            <input type="submit" value="Add">
            <c:forEach var="item" items="${list.items}">
                <input type="radio" name="listItem" value="${item.name}">
                <label for="${item.name}">${item.name}</label>
            </c:forEach>
                
                <input type="submit" value="Delete">
        </form>
    </body>
</html>
