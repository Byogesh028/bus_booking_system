<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String number=request.getParameter("number");
String email=request.getParameter("email");
String route=request.getParameter("route");
String date=request.getParameter("date");
String time=request.getParameter("time");
String seats=request.getParameter("seats");
if(id != null)
{
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking", "root", "844668");
String sql="Update busbooking1 set id=?,name=?,number=?,email=?,route=?,date=?,time=?,seats=? where id="+id;
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, name);
	ps.setString(3, number);
	ps.setString(4, email);
	ps.setString(5, route);
	ps.setString(6, date);
	ps.setString(7, time);
	ps.setString(8, seats);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
