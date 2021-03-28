/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author DELL
 */
public class UserDAO extends DBContext {
    public ArrayList<User> getList(){
        String sql="select * from HE141449_userID";
        ArrayList<User> list = new ArrayList<>();
        try{
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                list.add(u);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    public void deleteAccount(String username){
        String sql="delete  from HE141449_userID where username ='"+username+"'";
        try{
            PreparedStatement ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void addUser(int user_id, String username, String password, Date ngaysinh, String gioitinh, String email, String sdt, String diachi, String role) {
        String sql = "insert into HE141449_userID values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setDate(4, ngaysinh);
            ps.setString(5, gioitinh);
            ps.setString(6, email);
            ps.setString(7, sdt);
            ps.setString(8, diachi);
            ps.setString(9, role);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkUser(String username) {
        String sql = "select * from HE141449_userID where username='" + username + "'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean login(String username, String password) {

        String sql = "select * from HE141449_userID where username='" + username
                + "' and password='" + password + "'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateUser(User u) {

        String sql = "update HE141449_userID set user_id=?, password=?, ngaysinh=?, gioitinh=?, email=?, sdt=?, diachi=?, role=? where username=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, u.getUser_id());
            ps.setString(2, u.getPassword());
            ps.setDate(3, u.getNgaysinh());
            ps.setString(4, u.getGioitinh());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getSdt());
            ps.setString(7, u.getDiachi());
            ps.setString(8, u.getRole());
            ps.setString(9, u.getUsername());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public User getUser(String name) {

        String sql = "select * from HE141449_userID where username='" + name + "'";
        User u = new User();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                Date ngaysinh = rs.getDate("ngaysinh");
                String gioitinh = rs.getString("gioitinh");
                String email = rs.getString("email");
                String sdt = rs.getString("sdt");
                String diachi = rs.getString("diachi");
                String role = rs.getString("role");
                u = new User(user_id, username, password, ngaysinh, gioitinh, email, sdt, diachi, role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public int getLastID() {
        int id = 0;
        String sql = "select top 1 user_id from HE141449_userID order by user_id desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
}
