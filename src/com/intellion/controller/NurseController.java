package com.intellion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intellion.business.NurseBO;
import com.intellion.vo.NurseVO;

/**
 * Servlet implementation class NurseController
 */
@WebServlet("/NurseController")
public class NurseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NurseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        System.out.println("NurseController POST");
		
		HttpSession session = request.getSession(false);
		
		String operation = request.getParameter("operation");
		String nurseid = request.getParameter("id");
		String nursename = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		NurseVO nurseVO = null;
		NurseBO nurseBO = null;
		int requestResult = 0;
		
		System.out.println(operation);
		System.out.println(nurseid);
		System.out.println(nursename);
		System.out.println(email);
		System.out.println(password);
		System.out.println(address);
		System.out.println(phone);
		
		if(null != operation && ("ADD").equalsIgnoreCase(operation)){

			if(null != nurseid && null != nursename && null != email && null != password && null != address && null != phone){
				
				nurseVO = new NurseVO();
				nurseBO = new NurseBO();
				
				nurseVO.setNurseId(nurseid);
				nurseVO.setNurseName(nursename);
				nurseVO.setEmail(email);
				nurseVO.setPassword(password);
				nurseVO.setAddress(address);
				nurseVO.setPhone(phone);
				
				requestResult = nurseBO.addNurse(nurseVO);
				
				if(requestResult == 1){
					
					System.out.println("requestResult..:"+requestResult);
					session.setAttribute("result", "success");
					response.sendRedirect("/HMS/jsp/nurse.jsp");
					
					
				}
				
				//doGet(request, response);			
				
				
			}
			
		}
		
		
		
	}

}

		
	