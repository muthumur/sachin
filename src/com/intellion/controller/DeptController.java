package com.intellion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intellion.business.DeptBO;
import com.intellion.vo.DeptVO;

/**
 * Servlet implementation class DeptController
 */
@WebServlet("/DeptController")
public class DeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("DeptController GET");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("DeptController POST");
		
		HttpSession session = request.getSession(false);
		
		String operation = request.getParameter("operation");
		String deptId = request.getParameter("deptId");
		String deptName = request.getParameter("deptName");
		String deptDesc = request.getParameter("deptDesc");
		
		DeptVO deptVO = null;
		DeptBO deptBO = null;
		int requestResult = 0;
		
		System.out.println(operation);System.out.println(deptId);System.out.println(deptName);System.out.println(deptDesc);
		
		if(null != operation && ("ADD").equalsIgnoreCase(operation)){

			if(null != deptId && null != deptName && null != deptDesc){
				
				deptVO = new DeptVO();
				deptBO = new DeptBO();
				deptVO.setDeptId(deptId);
				deptVO.setDeptName(deptName);
				deptVO.setDeptDesc(deptDesc);
				
				requestResult = deptBO.addDept(deptVO);
				
				if(requestResult == 1){
					
					System.out.println("requestResult..:"+requestResult);
					session.setAttribute("result", "success");
					response.sendRedirect("/HMS/jsp/department.jsp");
					
				}
				
								
				
				
			}
			
		}
		
		
		
	}

}
