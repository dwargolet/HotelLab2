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
        <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" />
        
        <title>Hotel Lab 2</title> 
        
        
            
         
    </head>
    <body>
          <nav id="head" class="navbar navbar-default navbar-fixed-top">
            <div class="navbar-inner navbar-content-center">
                <h3>Hotel Lab - <i>Web Version</i></h3>
            </div>
        </nav>
        
        
        <div class="container">
            <div class="row">           
                <div class="col-sm-4">               
                      
                        
                            
                            <div class="table-responsive">
                                    <c:forEach var="hotel" items="${hotelList}">
                                        <table class="table table-condensed" id="recordListTable">
                                                <thead style="border: 2px solid red;">
                                                    <th>ID</th>
                                                    <br>
                                                    <th>Name</th>                                                                                               
                                               </thead>
                                                <tbody>
                                                    <tr>                                    
                                                        <td align="center">${hotel.hotelId}-</td>
                                                        <td align="center"><input type="hidden" id="listedHotelName" value="${hotel.hotelName}"/>${hotel.hotelName}</td><br>
                                                        <td align="center"><input type="hidden" id="listedHotelAddress" value="${hotel.streetAddress}"/>${hotel.streetAddress},</td>
                                                        <td align="center"><input type="hidden" id="listedHotelCity" value="${hotel.city}"/>${hotel.city},</td>
                                                        <td align="center"><input type="hidden" id="listedHotelState" value="${hotel.state}"/>${hotel.state}</td>
                                                        <td align="center"><input type="hidden" id="listedHotelZip" value="${hotel.zip}"/>${hotel.zip}</td>
                                                        <td align="center"><input type="hidden" id="listedHotelNote" value="${hotel.notes}"/>${hotel.notes}</td>
                                                        <td align="center"><input type="radio" id="listedHotelRadio" name="hotelRadio" value="${hotel.hotelId}"/> </td>
                                                    </tr>
                                                </tbody>    
                                        </table>               
                                    </c:forEach>                                                            
                            </div>
                    
                  
                    <div class="form-group">
                        <form id="createRecord" name="createRecord"  method="POST" action="<%= request.getContextPath() %>/hc?action=create">
                            <a name="createForm"></a>
                            <div class="form-control">
                                <input type="text" name="hotelId" id="hotelId" placeholder="Hotel ID"/>
                            </div> 
                            <div class="form-control">
                                <input type="text"  id="hotelName" name="hotelName" required="required" placeholder="Hotel Name"/>
                            </div> 
                            <div class="form-control">
                                <input type="text" id="hotelAddress" name="hotelAddress" required="required" placeholder="Address"/>
                            </div>
                            <div class="form-control">
                                <input type="text" id="hotelCity" name="hotelCity" required="required" placeholder="City"/>
                            </div>
                            <div class="form-control">
                                <input type="text" id="hotelState" name="hotelState" min="2" required="required" placeholder="State"/>
                            </div>
                            <div class="form-control">
                                <input type="number" id="hotelZip" name="hotelZip"  class="numReqd" required="required" placeholder="Zip"/>
                            </div>
                            <div class="form-control">
                                <input type="textarea" id="hotelNote" name="hotelNote" placeholder="Notes"/>
                            </div>           
<!--                            <input type="button" value="Create Record" id="createBtn"  class="btn btn-primary btn-sm" name="createBtn" >-->
                        <input type="button" value="Create Record" id="createBtn" class="btn btn-primary btn-sm" name="createBtn" >
                        </form>
                            
                    </div>
                    
 
                    

                </div>            
                          
<!--        <button class="btn btn-success btn-md" type="submit" id="editBtn"><i>Edit Record</i></button>-->
       
<!--            <div class="col-lg-6">-->
                
<!--            </div>-->
       
        </div>
        </div>           
                        
<!--    <div id="footer" class="container">-->
        <nav id="foot" class="navbar navbar-default navbar-fixed-bottom">
            <div class="navbar-inner navbar-content-center">
                <button class="btn btn-danger btn-md" type="submit" id="deleteBtn"><i>Delete Record</i></button>
                <button class="btn btn-success btn-md" type="submit" id="editBtn"><i>Edit Record</i></button>               
                <a class="btn btn-primary btn-md" href="#createForm" role="button" id="gotoBtn">Create Record</a>
            </div>
        </nav>
<!--    </div>-->
                        
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%= request.getContextPath() %>/javascript/js.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>     
    </body>
</html>
