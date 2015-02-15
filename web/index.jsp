<%-- 
    Document   : index
    Created on : Feb 10, 2015, 12:39:41 PM
    Author     : dworgolet
--%>

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
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <table class="table">
                        <th><h1>Hotels</h1></th>
                            <tr>
                                <div class="form-group">
                                    <td>Hotel Id</td>
                                    <td>Name</td>
                                </div>
                            </tr>
                            <% int i = 0; %>
                        <c:forEach var="hotel" items="${hotels}">
                        <tr>
                        <div class="form-group">
                            <td class="small_td">${hotel.hotelId}</td>
                            <td class="selectable notselected" id="${hotel.hotelId}" arraySpace="<%= i++ %>">${hotel.hotelName}</td>
                        </div>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-sm-2"></div>
                <div class="col-lg-6">
                
                    <form id="hotelForm" class="hotelselected" action="${resetAction}" method="POST">
                        <table class="table">
                            <th><h1>Hotel Info</h1></th>
                            <tr>
                                <div class="form-group">
                                    <td><label for="name">Hotel Name:</label></td>
                                    <td><input type="text" name="name" id="name" value="${hotelName}" class="required"/></td>
                                </div>
                            </tr>
                            <tr>
                                <div class="form-group">
                                    <td><label for="address">Address:</label></td>
                                    <td><input type="text" name="address" id="address" value="${address}" class="required"/></td>
                                </div>
                            </tr>
                            <tr>
                                <div class="form-group">
                                    <td><label for="city">City:</label></td>
                                    <td><input type="text" name="city" id="city" value="${city}" class="required"/></td>
                                </div>
                            </tr>
                            <tr>
                                <div class="form-group">
                                    <td><label for="state">State:</label></td>
                                    <td><input type="text" name="state" id="state" value="${state}" class="required"/></td>
                                </div>
                            </tr>
                            <tr>
                                <div class="form-group">
                                    <td><label for="postal">Zip Code:</label></td>
                                    <td><input type="text" name="zip" id="zip" value="${zip}" class="required"/></td>
                                </div>
                            </tr>
                            <tr>
                                <div class="form-group">
                                    <td><label for="notes">Notes:</label></td>
                                    <td><input type="textarea" name="notes" id="notes" value="${notes}" class=""/></td>
                                </div>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary" id="insertBtn">Create New</button>
                        <button type="button" class="btn btn-primary" id="updateBtn">Update</button>
                        <button type="button" class="btn btn-danger" id="deleteBtn">Delete</button>
                        <button type="button" class="btn btn-primary" id="clearBtn">Clear Form</button>
            
                </div>                               
            </div>
        </div>
                 
                                
                                
                                
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    </body>
</html>
