/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    

    $('#hotelId').focus(function(e) {   
        $(this).blur();
    });
    
    $('.numReqd').keyup(function () { 
	    this.value = this.value.replace(/[^0-9\.]/g,'');	    
    });
        
    $('#deleteBtn').click(function () {        
        var hotelId = $("input:radio[name=hotelRadio]:checked").val();
        createRecord.hotelId.value = hotelId;

        $('#createRecord').attr('action',  "hc?action=delete");        
        $('#createRecord').submit();
        return;
    });
    
    
    $('#editBtn').click(function () {
        $('#deleteBtn').prop('disabled', true);
        
        var hotelId = $("input:radio[name=hotelRadio]:checked").val();
        createRecord.hotelId.value = hotelId;
        $("input:radio[name=hotelRadio]:checked").each(function(){
                    var $row = $(this).parents('tr'); 
                    var hotelState = $row.find("#listedHotelState").val();                   
                    var hotelName = $row.find("#listedHotelName").val();        
                    var hotelAddress = $row.find("#listedHotelAddress").val();
                    var hotelCity = $row.find("#listedHotelCity").val();                    
                    var hotelZip = $row.find("#listedHotelZip").val();
                    var hotelNote = $row.find("#listedHotelNote").val();
                    
                    createRecord.hotelName.value = hotelName;
                    createRecord.hotelAddress.value = hotelAddress;
                    createRecord.hotelCity.value = hotelCity;
                    createRecord.hotelState.value = hotelState;
                    createRecord.hotelZip.value = hotelZip;
                    createRecord.hotelNote.value = hotelNote;
                    
                });
                
        createRecord.hotelId.value = hotelId;
//        var hotelName = $("#listedHotelName").val();        
//        var hotelAddress = $("#listedHotelAddress").val();
//        var hotelCity = $("#listedHotelCity").val();
//        var hotelState = $("#listedHotelState").val();
//        var hotelZip = $("#listedHotelZip").val();
//        var hotelNote = $("#listedHotelNote").val();
        
        $('#createRecord').attr('action',  "hc?action=edit");        
        
//        createRecord.hotelId.value = hotelId;
//        createRecord.hotelName.value = hotelName;
//        createRecord.hotelAddress.value = hotelAddress;
//        createRecord.hotelCity.value = hotelCity;
//        createRecord.hotelState.value = hotelState;
//        createRecord.hotelZip.value = hotelZip;
//        createRecord.hotelNote.value = hotelNote;
        
       
        createRecord.createBtn.value = "Edit Record";
        
        return false;
    });
    

    $('#createBtn').click(function () {  
        
        $('#editBtn').prop('disabled', false);
        $('#deleteBtn').prop('disabled', false);
        
        $('#createRecord').submit();
        return;
    });

});