/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author DELL
 */
public class CategoryDAO extends DBContext {

    public void addCategory(Category c) {
        String sql = "insert into HE141449_category values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, c.getMa_the_loai());
            ps.setString(2, c.getTen_the_loai());
            ps.setString(3, c.getMo_ta());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Category> getList() {

        String sql = "select * from HE141449_category";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_the_loai = rs.getInt("ma_the_loai");
                String ten_the_loai = rs.getString("ten_the_loai");
                String mo_ta = rs.getString("mo_ta");
                list.add(new Category(ma_the_loai, ten_the_loai, mo_ta));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void delCategory(int ma_the_loai) {

        String sql = "delete from HE141449_category where ma_the_loai='" + ma_the_loai
                + "'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public Category getCategory(int id) {
		
		String sql = "select * from HE141449_category where ma_the_loai='" + id + "'";
		Category c = new Category();
		try {
			PreparedStatement ps =  con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int ma_the_loai = rs.getInt("ma_the_loai");
				String ten_the_loai = rs.getString("ten_the_loai");
				String mo_ta = rs.getString("mo_ta");
				c = new Category(ma_the_loai, ten_the_loai, mo_ta);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
    
    public void updateCategory(Category c) {
		
		String sql = "update HE141449_category set ten_the_loai=?, mo_ta=? where ma_the_loai=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getTen_the_loai());
			ps.setString(2, c.getMo_ta());
			ps.setInt(3, c.getMa_the_loai());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
     
}
