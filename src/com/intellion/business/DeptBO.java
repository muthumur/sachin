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



public class DeptBO {

	public int addDept(DeptVO deptVO) {
		
		System.out.println("addDept called...:");
		int result = -1; 
		Connection con = null;
		Statement st = null;
		
		try {

			String deptId = StringUtilCustom.NullToEmptyString(deptVO.getDeptId());
			String deptName = StringUtilCustom.NullToEmptyString(deptVO.getDeptName());
			String deptDesc = StringUtilCustom.NullToEmptyString(deptVO.getDeptDesc());
			
			
			System.out.println(deptId);
			System.out.println(deptName);
			System.out.println(deptDesc);
			
			
			
			con = DBManager.getDBConnection();

			st = con.createStatement();
			
			

			String sqlQuery = "INSERT INTO DEPARTMENT_MASTER (dept_id, dept_name, dept_desc)"
					+ " VALUES ('" + deptId + "','"
					+ deptName + "','"
					+ deptDesc +"')";

			
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
	
public List<DeptVO> getDeptList() {
		
	    DeptVO deptVO = null;
		List<DeptVO> deptVOList = new ArrayList<DeptVO>();
		 
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		try {

		
			con = DBManager.getDBConnection();

			st = con.createStatement();

			String sqlQuery = "SELECT dept_id,dept_name,dept_desc from DEPARTMENT_MASTER";

			System.out.println(sqlQuery);

			rs = st.executeQuery(sqlQuery);
			
			while(rs.next()){
				
				deptVO = new DeptVO();
				String deptId = (String)rs.getString("dept_id");
				String deptName = (String)rs.getString("dept_name");
				String deptDesc = (String)rs.getString("dept_desc");
				
				deptVO.setDeptId(deptId);
				deptVO.setDeptName(deptName);
				deptVO.setDeptDesc(deptDesc);
				deptVOList.add(deptVO);
				
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

		return deptVOList;
	}	
	

public DeptVO getDeptDetailsById(String deptIdParam) {
	System.out.println("getDeptDetailsById called");
	DeptVO deptVO = null;
	
	
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try {

	
		con = DBManager.getDBConnection();

		st = con.createStatement();

		String sqlQuery = "SELECT dept_id,dept_name,dept_desc from DEPARTMENT_MASTER where dept_id="+deptIdParam;

		System.out.println(sqlQuery);

		rs = st.executeQuery(sqlQuery);
		
		while(rs.next()){
			
			deptVO = new DeptVO();
			String deptId = (String)rs.getString("dept_id");
			String deptName = (String)rs.getString("dept_name");
			String deptDesc = (String)rs.getString("dept_desc");
			
			deptVO.setDeptId(deptId);
			deptVO.setDeptName(deptName);
			deptVO.setDeptDesc(deptDesc);
			
			
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

	return deptVO;
}	




	
	public int getDeptIDMax() {
		System.out.println("getDeptIDMax called");
		int deptIdMax=0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		try {

		
			con = DBManager.getDBConnection();
			st = con.createStatement();
			String sqlQuery = "SELECT MAX(dept_id) AS dept_id FROM DEPARTMENT_MASTER;";
			System.out.println(sqlQuery);
			rs = st.executeQuery(sqlQuery);
		
			while(rs.next()){
				
				deptIdMax = (new Integer(rs.getInt("dept_id")).intValue());
				
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
		System.out.println("deptIdMax..:"+deptIdMax);
		return deptIdMax;
	}			
	
}



			
	