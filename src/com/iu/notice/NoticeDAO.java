package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	//getNum
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="select board_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	//getTotalCount
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select nvl(count(num),0) from notice where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		
		ResultSet rs = st.executeQuery();
		rs.next();
		
		int totalCount=rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return totalCount;
		
	}
	
	//hitUpdate
	public int hitUpdate(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="update notice set hit=hit+1 where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//selectList
	public ArrayList<NoticeDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from notice where "+kind+" like ? order by num desc) N) "
				+ "where R between ? and ?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<NoticeDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			NoticeDTO noticeDTO=new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			
			list.add(noticeDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return list;
	}
	
	public NoticeDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		NoticeDTO noticeDTO=null;
		
		String sql="select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();		
		if(rs.next()) {
			noticeDTO=new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, st, con);
		
		return noticeDTO;
	}
	
	public int insert(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into notice values(?,?,?,?,sysdate,0)"; //num, title, writer, contents
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, noticeDTO.getNum());
		st.setString(2, noticeDTO.getTitle());
		st.setString(3, noticeDTO.getWriter());
		st.setString(4, noticeDTO.getContents());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public int update(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="update notice set title=?,contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
}
