package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class MemberDAO {
	//id Check
	public boolean idCheck(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		boolean check=true;
		String sql="select * from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
				check=false;
		}		
		
		DBConnector.disConnect(rs, st, con);
		return check;
	}
	
	//getCount
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select nvl(count(id),0) from member where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		
		int totalCount=rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return totalCount;
		
	}

	//selectList
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con=DBConnector.getConnect();
		
		String sql="select * from "
				+ "(select rownum R, ID.* from "
				+ "(select * from member where "+kind+" like ? order by id asc) ID) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		while(rs.next()) {
			MemberDTO memberDTO= new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			
			list.add(memberDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return list;
	}
	
	//insert
	public int insert(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getId());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getAge());
		st.setString(7, memberDTO.getJob());		
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

}
