package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class QnaDAO {

	//getTotalCount
	public void getTotalCount() {
		
	}
	
	//HitUpdate
	public void HitUpdate() {
		
	}
	
	//selectList
	public ArrayList<QnaDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select * from qna";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		ArrayList<QnaDTO> list = new ArrayList<>();
		while(rs.next()) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("date"));
			
			list.add(qnaDTO);
		}
		
		DBConnector.disConnect(rs, st, con);		
		return list;
	}
	
	//selectOne
	public QnaDTO selectOne(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="select * from qna where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		QnaDTO qnaDTO=null;
		
		if(rs.next()) {
			qnaDTO= new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
	}
	
	//insert
	public int insert(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="insert into qna values(qna_seq.value,?,?,sysdate,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getWriter());
		st.setInt(3, qnaDTO.getHit());
		
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
