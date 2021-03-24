package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Reported;

public class ReportedDAO extends DBContext {

    public void insertReport(int ma_san_pham, String li_do) throws SQLException {
        String sql = "insert into HE141449_Reported values(?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        try {
            ps.setInt(1, ma_san_pham);
            ps.setString(2, li_do);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Reported> getList(){
        String sql="select * from HE141449_Reported";
        ArrayList<Reported> list = new ArrayList<>();
        try{
            PreparedStatement ps =con.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                int ma_san_pham = rs.getInt(1);
                String li_do = rs.getString(2);
                Reported r = new Reported(ma_san_pham, li_do);
                list.add(r);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    public void delete(int ma_san_pham){
        String sql= "delete from HE141449_Reported where ma_san_pham = "+ma_san_pham;
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
