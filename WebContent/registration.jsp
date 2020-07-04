<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String course=request.getParameter("course");
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student001","root","root");
   PreparedStatement ps=con.prepareStatement("insert into stu values(?,?,?)");
   PreparedStatement ps1=con.prepareStatement("insert into course values(?)");
   ps.setString(1,name);
   ps.setString(2,email);
   ps.setString(3,address);
   ps1.setString(1,course);
   int i= ps.executeUpdate();
   int i1=ps1.executeUpdate();
   con.close();
   ps.close();
   ps1.close();
   if(i>0 &&i1==1){
	   out.println("Registration success");
	   }
   else{
	   out.println("something went wrong");
   }
   
   %>
</body>
</html>