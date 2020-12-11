package com.SPASM.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AssignmentMarksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AssignmentMarksServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome to AssignmentMarksServlet..");
		String studentName=request.getParameter("studentNameAssigned");
		String marks=request.getParameter("marks");
		System.out.println(studentName);
		System.out.println(marks);
	}

}
