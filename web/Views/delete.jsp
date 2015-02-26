<%-- 
    Document   : delete
    Created on : Feb 17, 2015, 1:54:25 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css"/>
        <title>Delete Record</title>
    </head>
    <body>
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="<%= request.getContextPath() %>Views/index.jsp">Main</a></li>           
        </ul>
        
        
        <form id="deleteRecord" name="deleteRecord" method="POST" action="<%= request.getContextPath() %>/hc?action=delete">
            <h2 style="text-align: center;">Record</h2>
            
            <div class="row">
                <c:forEach var="hotel" items="${hotelList}">
                    <table>
                            <thead>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Zip</th>
                                <th>Notes</th>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>${hotel.hotelId}</td>
                                    <td>${hotel.hotelName}</td>
                                    <td>${hotel.streetAddress}</td>
                                    <td>${hotel.city}</td>
                                    <td>${hotel.state}</td>
                                    <td>${hotel.zip}</td>
                                    <td>${hotel.notes}</td>
                                </tr>
                            </tbody>    
                    </table>               
                </c:forEach>          
                <button class="btn btn-default" type="submit"><i>Delete Record</i></button>
            </div>
        </form>
    </body>
</html>
