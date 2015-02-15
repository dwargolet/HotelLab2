
package HotelModel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class HotelService {
    
    private HotelDAOInterface dao;
    
    public HotelService(){
        dao = new HotelDAO();
    }
    
    public void updateHotelRecord(int pk, String field, String value){
        dao.updateHotelRecord(pk, "state", "NY");
    }
    
    
    public void deleteHotelRecord(int pk){
        dao.deleteHotelRecord(pk);
    }
    
    public List<Hotel> findAllHotels(){
       // List<Hotel>hotels = dao.findAllHotels();
//        for(Hotel h : hotels){
//            System.out.println(h);
//        }
        return dao.findAllHotels();
    }
    
    public void insertHotelRecord(String name, String address, String city, String state,
            String zip, String notes){
        List<String> colNames = new ArrayList<>();
        List values = new ArrayList();
        colNames.add("hotel_name");
        colNames.add("street_address");
        colNames.add("city");
        colNames.add("state");
        colNames.add("postal_code");
        colNames.add("notes");
        
        values.add(name);
        values.add(address);
        values.add(city);
        values.add(state);
        values.add(zip);
        values.add(notes);
                
        dao.insertHotelRecord(colNames, values);
    }
    
//    public static void main(String[] args) {
//        HotelService h = new HotelService();
//        
//        System.out.println(h.findAllHotels());
//    }
}
