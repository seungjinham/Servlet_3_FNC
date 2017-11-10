package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class QnaDAO {

	//getTotalCount
	public int getTotalCount() throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select nvl(count(num),0) from qna";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		
		int totalCount = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}
	
	//HitUpdate
	public int hitUpdate(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="update qna set hit=hit+1 where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//selectList
	public ArrayList<QnaDTO> selectList(int startRow, int lastRow) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from qna order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, startRow);
		st.setInt(2, lastRow);
		ResultSet rs = st.executeQuery();
		
		ArrayList<QnaDTO> list = new ArrayList<>();
		while(rs.next()) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			
			list.add(qnaDTO);
		}
		
		DBConnector.disConnect(rs, st, con);		
		return list;
	}
	
	//selectOne
	public QnaDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		QnaDTO qnaDTO=null;
		
		if(rs.next()) {
			qnaDTO= new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
	}
	
	//insert
	public int insert(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);		
		return result;
	}
	
	//update
	public int update(QnaDTO qnaDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="update qna set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setInt(3, qnaDTO.getNum());
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);		
		return result;
	}
	
	//delete
	public int delete(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="delete qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);		
		return result;
	}
}
