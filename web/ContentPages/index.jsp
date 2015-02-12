<%-- 
    Document   : index
    Created on : Feb 10, 2015, 12:39:41 PM
    Author     : dworgolet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Hotel Lab 2</title>
        
        
        
    </head>
    <body>
 
        
       
        <table>
            <thead>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Zip</th>
            <th>Notes</th>
            <th>Action</th>
            <tbody>
                <c:forEach var ="hotel" items="${records}" >
                    <tr>
                        <td>${hotel.hotelId}</td>
                        <td>${hotel.hotelName}</td>
                        <td>${hotel.streetAddress}</td>
                        <td>${hotel.city}</td>
                        <td>${hotel.state}</td>
                        <td>${hotel.zip}</td>
                        <td>${hotel.notes}</td>
                        <td><button value="Edit" onclick="document.href='HotelController?id=${hotel.hotelId}'"></button>
                    </tr>
                </c:forEach>
            </tbody>
            </thead>
        </table>
     
            <form id="recForm" name="recForm" method="POST" action="<%= request.getContextPath() %>/hc?action=rec">
                
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i>Calculate</i></button>
                </span>            
            </form>
            
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    </body>
</html>
