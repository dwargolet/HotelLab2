
package HotelModel;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author dworgolet
 */
public interface HotelDAOInterface extends DAOInterface {
    
//    public abstract List<Hotel> findHotelById(int hotelId);
    public abstract List<Hotel> findAllHotels();
    public abstract int deleteHotelRecord(int pk);
    public abstract int updateHotelRecord(int pk, String colName, String values);
    public abstract int insertHotelRecord(List<String> colNames, List values);       
}
