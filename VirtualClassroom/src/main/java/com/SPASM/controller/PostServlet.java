package com.SPASM.controller;

import java.io.IOException;
//import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SPASM.DAO.DatabaseDAO;
import com.SPASM.model.PostMsg;


public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PostServlet() {
        super();
        
    }

	
   DatabaseDAO dao=new DatabaseDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//List<String> st=new ArrayList<String>();
	//st.add(request.getParameter("msg"));
	//PrintWriter out=response.getWriter();
		
		
		String st=request.getParameter("msg");
		
		HttpSession session=request.getSession();
		String classcode=(String) session.getAttribute("classcode");
		String classname=(String) session.getAttribute("classname");
		System.out.println("post to:"+classcode);
		
	PostMsg m=new PostMsg();
	m.setMsg(st);
	m.setCode(classcode);
	
	try {
		dao.msgInsert(m);
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}

	response.sendRedirect("CreateTeacher.jsp?code="+classcode+"&classname="+classname);//URL re-writing
	}
	

}
