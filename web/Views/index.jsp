<%-- 
    Document   : index
    Created on : Feb 10, 2015, 12:39:41 PM
    Author     : dworgolet
--%>

<%--<%@page import="java.util.ArrayList"%>--%>
<%--<%@page import="HotelModel.Hotel"%>
<%@page import="java.util.List"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Hotel Lab 2</title> 
        
    </head>
    <body>
        <h1>List of Hotels</h1>
        <form id="recordList" name="recordList" method="POST" action='<%= request.getContextPath() + "/hc"%>'>
            <h2>Records</h2>
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
            <input type="submit" name="submit" value="Retrieve Records" />
        </form>
        
                
        
    </body>
</html>
