package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	Connection conn;
	PreparedStatement ptmt;
	ResultSet rs;
	public Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		return conn;
	}
	
	public String getcustno_num(){
		String res = "";
		try {
			conn = getConnection();
			String sql = "select max(custno)+1 as custno from member_tbl_02";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			 while (rs.next()) {
				 res = rs.getString("custno");
			}
				
			System.out.println(res+"1");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return res;
		
	}
	
	public int getInsert(VO vo){
		int res = 0;
		try {
			conn = getConnection();
			String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, vo.getCustno());
			ptmt.setString(2,vo.getCustname());
			ptmt.setString(3,vo.getPhone());
			ptmt.setString(4,vo.getAddress());
			ptmt.setString(5,vo.getJoindate());
			ptmt.setString(6,vo.getGrade());
			ptmt.setString(7,vo.getCity());
			res = ptmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	return res;
	}
	
	public List<VO>getList(){
		List<VO>list = new ArrayList<>();
		try {
			conn = getConnection();
			String sql ="select * from member_tbl_02 order by custno";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()){
				VO vo = new VO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	public List<PVO> getInnerJoin(){
		List<PVO>list2 = new ArrayList<>();
		String result = "";
		try {
			conn = getConnection();
			String sql = "select c.custno,c.custname,c.grade,price from member_tbl_02 c,(select custno,sum(price)as price from money_tbl_02 group by custno) m where c.custno = m.custno";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()){
				PVO pvo = new PVO();
				pvo.setCustno(rs.getString(1));
				pvo.setCustname(rs.getString(2));
				result =rs.getString(3);
				if(result.equalsIgnoreCase("A")){
					pvo.setGrade("VIP");
				}else if(result.equalsIgnoreCase("B")){
					pvo.setGrade("일반");
				}else{
					pvo.setGrade("직원");
				}
				pvo.setPrice(rs.getString(4));
				list2.add(pvo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list2;
	}
	
	public VO getOneListModify(String custno){
		VO vo = new VO();
		try {
			conn = getConnection();
			String sql = "select * from member_tbl_02 where custno =?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1,custno);
			rs = ptmt.executeQuery();
			while(rs.next()){
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5).substring(1, 10));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return vo;
	}
	public int getModify(VO vo){
		int res = 0;
		try {
			conn = getConnection();
			String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1,vo.getCustname());
			ptmt.setString(2, vo.getPhone());
			ptmt.setString(3, vo.getAddress());
			ptmt.setString(4, vo.getJoindate());
			ptmt.setString(5, vo.getGrade());
			ptmt.setString(6, vo.getCity());
			ptmt.setString(7, vo.getCustno());
			res = ptmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				ptmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return res;
	}
}
