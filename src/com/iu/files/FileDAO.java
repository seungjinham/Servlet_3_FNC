package com.iu.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class FileDAO {

	//selectList
	public ArrayList<FileDTO> selectList(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from files where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		ArrayList<FileDTO> list = new ArrayList<>();
		while(rs.next()) {
			FileDTO f = new FileDTO();
			f.setfName(rs.getString("fName"));
			f.setoName(rs.getString("oName"));
			
			list.add(f);
		}
		
		DBConnector.disConnect(rs, st, con);
		return list;
		
	}
	
	//insert
	public int insert(FileDTO fileDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="insert into files values(?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, fileDTO.getNum());
		st.setString(2, fileDTO.getoName());
		st.setString(3, fileDTO.getfName());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;		
	}
}
