package com.SPASM.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.SPASM.model.PostMsg;
import com.SPASM.model.ReplyModel;
import com.SPASM.model.Student;
import com.SPASM.model.Teacher;


public class DatabaseDAO {
	String url="jdbc:mysql://localhost:3306/virtualclassroom";
	String user="root";
	String password="";
	
	
	
	
	public void insert(Teacher h) throws ClassNotFoundException {
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="INSERT INTO teacher (classname, section, name, subject, mailid,classcode) VALUES (?,?,?,?,?,?)";
		try
		{
			Connection con=DriverManager.getConnection(url, user, password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,h.getClassname());
			//st.setString(2,h.getClassdescription());
			st.setString(2,h.getSection());
			st.setString(3,h.getName());
			st.setString(4,h.getSubject());
			//st.setString(6, h.getTeachername());
			st.setString(5,h.getMailid());
			//st.setString(8,h.getPassword());
			st.setString(6, h.getClasscode());
			int i=st.executeUpdate();
			System.out.println(i+"row inserted teacher table");
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
			System.out.println(i+"row inserted for student table");
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

public void msgInsert(PostMsg h) throws ClassNotFoundException {
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String sql="INSERT INTO upload (classcode,post,date,time) VALUES (?,?,?,?)";
	try
	{
		Connection con=DriverManager.getConnection(url, user, password);
				
		java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
        
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,h.getCode());
		st.setString(2, h.getMsg());
		
		st.setDate(3, sqlDate);
		st.setTime(4, sqlTime);
		
		int i=st.executeUpdate();
		System.out.println(i+"row inserted for upload table");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}
public void insertReply(ReplyModel c) throws ClassNotFoundException {
	//	System.out.println(h.getNew_com_code()+h.getNew_com_text());
		//driver();
	Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="INSERT INTO upload_comment (msg_id,comment,date_cmnt,time_cmnt) VALUES (?,?,?,?)";
		try
		{
			Connection con=DriverManager.getConnection(url, user, password);
			
			
			java.util.Date utilDate = new java.util.Date();
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	        java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	        
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,c.getNew_reply_code());
			st.setString(2,c.getNew_reply_text());
			
			
			st.setDate(3, sqlDate);
			st.setTime(4, sqlTime);
			
			
			int i=st.executeUpdate();
			System.out.println(i+"row inserted teacher table");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	


}