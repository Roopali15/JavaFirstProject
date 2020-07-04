<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student001","root","root");
   PreparedStatement ps=con.prepareStatement("select distinct(course) from course");
   ResultSet rs=ps.executeQuery();
   ResultSetMetaData rsmd=rs.getMetaData();



%>
<form action="registration.jsp" method="get">
<pre>
    Name:    <input type="text" name="name" placeholder="Enter name">
    Email:   <input type="text" name="email" placeholder="Enter email id">
    Address: <input type="text" name="address" placeholder="Enter address">
    Course:  <select  name="course">
    <%   while(rs.next()){
    	%>
    	
         <option value="<%=rs.getString(1)%>"><%=rs.getString(1) %> </option>
         <%
         }
         %>
         </select>
         <input type="submit" name="Submit">
         </pre>
         </form>
</body>
</html>