package com.SPASM.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.SPASM.model.Student;
import com.SPASM.model.Teacher;

public class DatabaseDAO {
	String url="jdbc:mysql://localhost:3306/virtualclassroom";
	String user="root";
	String password="";
	
	
	
	
	public void insert(Teacher h) throws ClassNotFoundException {
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="INSERT INTO teacher (classname,classdescription, section, room, subject,teachername, mailid, password,classcode) VALUES (?,?,?,?,?,?,?,?,?)";
		try
		{
			Connection con=DriverManager.getConnection(url, user, password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,h.getClassname());
			st.setString(2,h.getClassdescription());
			st.setString(3,h.getSection());
			st.setString(4,h.getRoom());
			st.setString(5,h.getSubject());
			st.setString(6, h.getTeachername());
			st.setString(7,h.getMailid());
			st.setString(8,h.getPassword());
			st.setString(9, h.getClasscode());
			int i=st.executeUpdate();
			System.out.println(i+"row inserted");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public void studentInsert(Student s) throws ClassNotFoundException {
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="INSERT INTO student (smailid, scontactno) VALUES (?,?)";
		try
		{
			Connection con=DriverManager.getConnection(url, user, password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,s.getMailid());
			st.setString(2,s.getContactno());
			
			int i=st.executeUpdate();
			System.out.println(i+"row inserted");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
public boolean search(String classcode) throws ClassNotFoundException {
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="SELECT * FROM teacher WHERE classcode=?";
		try
		{
			Connection con=DriverManager.getConnection(url, user, password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,classcode);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				return true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}



}