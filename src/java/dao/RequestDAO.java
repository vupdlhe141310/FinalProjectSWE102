
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.request;


public class RequestDAO extends DBContext{
    public void addRequest(request r){
        String sql="insert into HE141449_request values('?','?','?')";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,r.getUsername());
            ps.setString(2,r.getReason());
            ps.setString(3,r.getType());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public ArrayList<request> getList(){
        String sql="select * from HE141449_request";
        ArrayList<request> list = new ArrayList<>();
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                request r = new request(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(r);
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
}
