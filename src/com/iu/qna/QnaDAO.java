package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class QnaDAO {
	//replyInsert
	public int replyInsert(QnaDTO qnaDTO, QnaDTO parent) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		st.setInt(4, parent.getRef());
		st.setInt(5, parent.getStep()+1);
		st.setInt(6, parent.getDept()+1);
		
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);		
		return result;	
	}
	
	//replyUpdate
	public int replyUpdate(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="update qna set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getRef());
		st.setInt(2, qnaDTO.getStep());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;		
	}

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
				+ "(select * from qna order by num desc, ref desc, step asc) N) "
				+ "where R between ? and ? "
				+ "order by ref desc, step asc";
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
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDept(rs.getInt("dept"));
			
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
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDept(rs.getInt("dept"));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
	}
	
	//insert
	public int insert(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate,qna_seq.currval, 0, 0)";
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
