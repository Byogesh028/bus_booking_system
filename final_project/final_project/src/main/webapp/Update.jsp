<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking", "root", "844668");
Statement st=conn.createStatement();
String sql ="select * from busbooking1 where id="+id;
ResultSet resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="Process.jsp">
<table>
<tr><td>
Id:
<input type="text" name="id" value="<%=resultSet.getString("id") %>">
</td></tr>
<tr><td>
Name:
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
</td></tr>
<tr><td>
Number:
<input type="text" name="number" value="<%=resultSet.getString("number") %>">
</td></tr>
<tr><td>
Email :
<input type="email" name="email" value="<%=resultSet.getString("email") %>">
</td></tr>
<tr><td>
Route:
<input type="text" name="route" value="<%=resultSet.getString("route") %>">
</td></tr>
<tr><td>
Date:
<input type="text" name="date" value="<%=resultSet.getString("date") %>">
</td></tr>
<tr><td>
Time:
<input type="text" name="time" value="<%=resultSet.getString("time") %>">
</td></tr>
<tr><td>
Seats:
<input type="text" name="seats" value="<%=resultSet.getString("seats") %>">
</td></tr>
<tr><td>
<input type="submit" value="update record">
</td></tr>
</table>
</form>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>