package com.intellion.business;

import java.sql.Connection;

import java.sql.SQLException;
 

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.intellion.util.DBManager;
import com.intellion.util.StringUtilCustom;
import com.intellion.vo.DeptVO;
import com.intellion.vo.NurseVO;

public class NurseBO {
	
public int addNurse(NurseVO nurseVO) {
		
		System.out.println("addNurse called:");
		int result = -1; 
		Connection con = null;
		Statement st = null;
		
		try {

			String nurseId = StringUtilCustom.NullToEmptyString(nurseVO.getNurseId());
			String nurseName = StringUtilCustom.NullToEmptyString(nurseVO.getNurseName());
			String email = StringUtilCustom.NullToEmptyString(nurseVO.getEmail());
			String password = StringUtilCustom.NullToEmptyString(nurseVO.getPassword());
			String address = StringUtilCustom.NullToEmptyString(nurseVO.getAddress());
			String phone = StringUtilCustom.NullToEmptyString(nurseVO.getPhone());
			
			
			System.out.println(nurseId);
			System.out.println(nurseName);
			System.out.println(email);
			System.out.println(password);
			System.out.println(address);
			System.out.println(phone);
			
			
			
			con = DBManager.getDBConnection();

			st = con.createStatement();
			
			

			String sqlQuery = "INSERT INTO NURSE_MASTER (nurse_id, nurse_name, nurse_email,nurse_password,nurse_address,nurse_phone)"
					+ " VALUES ('" + nurseId + "','"
					+ nurseName + "','"
					+ email + "','"
					+ password + "','"
					+ address + "','"
					+ phone +"')";

			
			System.out.println(sqlQuery);

			result = st.executeUpdate(sqlQuery);

			System.out.println(result);

		} catch (Exception e) {
			System.out.println(e);
		}finally{
			try {
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		return result;
	
	
	}

public List<NurseVO> getNurseList() {
	
    NurseVO nurseVO = null;
	List<NurseVO> nurseVOList = new ArrayList<NurseVO>();
	 
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try {

	
		con = DBManager.getDBConnection();

		st = con.createStatement();

		String sqlQuery = "SELECT nurse_id, nurse_name, nurse_email,nurse_password,nurse_address,nurse_phone from NURSE_MASTER";

		System.out.println(sqlQuery);

		rs = st.executeQuery(sqlQuery);
		
		while(rs.next()){
			
			nurseVO = new NurseVO();
			String nurseId = (String)rs.getString("nurse_id");
			String nurseName = (String)rs.getString("nurse_name");
			String email = (String)rs.getString("nurse_email");
			String password = (String)rs.getString("nurse_password");
			String address = (String)rs.getString("nurse_address");
			String phone = (String)rs.getString("nurse_phone");
			
			nurseVO.setNurseId(nurseId);
			nurseVO.setNurseName(nurseName);
			nurseVO.setEmail(email);
			nurseVO.setPassword(password);
			nurseVO.setAddress(address);
			nurseVO.setPhone(phone);
			nurseVOList.add(nurseVO);
	
		}

		

	} catch (Exception e) {
		System.out.println(e);
	}finally{
		try {
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	return nurseVOList;
}	

public NurseVO getNurseDetailsById(String nurseIdParam) {
	System.out.println("getNurseDetailsById called");
	NurseVO nurseVO = null;
	
	
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try {

	
		con = DBManager.getDBConnection();

		st = con.createStatement();

		String sqlQuery = "SELECT nurse_id, nurse_name, nurse_email,nurse_password,nurse_address,nurse_phone from NURSE_MASTER where nurse_id="+nurseIdParam;

		System.out.println(sqlQuery);

		rs = st.executeQuery(sqlQuery);
		
		while(rs.next()){
			
			nurseVO = new NurseVO();
			String nurseId = (String)rs.getString("nurse_id");
			String nurseName = (String)rs.getString("nurse_name");
			String email = (String)rs.getString("nurse_email");
			String password = (String)rs.getString("nurse_password");
			String address = (String)rs.getString("nurse_address");
			String phone = (String)rs.getString("nurse_phone");
			
			nurseVO.setNurseId(nurseId);
			nurseVO.setNurseName(nurseName);
			nurseVO.setEmail(email);
			nurseVO.setPassword(password);
			nurseVO.setAddress(address);
			nurseVO.setPhone(phone);
			
			
		}

		

	} catch (Exception e) {
		System.out.println(e);
	}finally{
		try {
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	return nurseVO;
}	

public int getNurseIDMax() {
	System.out.println("getNurseIDMax called");
	int nurseIdMax=0;
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try {

	
		con = DBManager.getDBConnection();
		st = con.createStatement();
		String sqlQuery = "SELECT MAX(nurse_id) AS nurse_id FROM NURSE_MASTER;";
		System.out.println(sqlQuery);
		rs = st.executeQuery(sqlQuery);
	
		while(rs.next()){
			
			nurseIdMax = (new Integer(rs.getInt("nurse_id")).intValue());
			
		}

	} catch (Exception e) {
		System.out.println(e);
	}finally{
		try {
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	System.out.println("nurseIdMax..:"+nurseIdMax);
	return nurseIdMax;
}			
	

}
