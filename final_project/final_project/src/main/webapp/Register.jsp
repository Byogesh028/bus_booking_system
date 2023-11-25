<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
    <%
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String number=request.getParameter("number");
    String email=request.getParameter("email");
    String route=request.getParameter("route");
    String date=request.getParameter("date");
    String time=request.getParameter("time");
    String seats=request.getParameter("seats");
    String query="insert into busbooking1 values(?,?,?,?,?,?,?,?)";
   
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","844668");
    	Statement stmt=con.createStatement();
  
       PreparedStatement ps=con.prepareStatement(query);
       ps.setString(1, id);
       ps.setString(2, name);
    	ps.setString(3, number);
    	ps.setString(4, email);
    	ps.setString(5, route);
    	ps.setString(6, date);
    	ps.setString(7, time);
    	ps.setString(8, seats);
    	
    	int i=ps.executeUpdate();
    	if(i>0)
    	{
    	out.println("value inserted succesfully<br><br>");
    	}else{
    	out.println("value is not inserted");
    	}
    	%>
        	<h2 align="center">Bus Booking </h2>
  			<table align="center" cellpadding="3" cellspacing="0" border="5">
           
				<tr bgcolor="lightblue">
				<td><b>id</b></td>
				<td><b>name</b></td>
				<td><b>number</b></td>
				<td><b>email</b></td>
				<td><b>route</b></td>
				<td><b>date</b></td>
				<td><b>time</b></td>
				<td><b>seats</b></td>
				<td><b>delete</b></td>
				<td><a href="Book.html"><button type="button" class="add">Add</button></a></td>
				</tr>
				<%
				
				 String QUERY = "SELECT * from busbooking1";
			        ResultSet rs = stmt.executeQuery(QUERY);
			        
			        while(rs.next())
			            {
			        	%>
                <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
				<td><%=rs.getString("number") %></td>
			    <td><%=rs.getString("email") %></td>
				<td><%=rs.getString("route") %></td>
				<td><%=rs.getString("date") %></td>
				<td><%=rs.getString("time") %></td>
			   <td><%=rs.getString("seats") %></td>
			    
			    <td><a href="Delete.jsp?id=<%=rs.getString("id") %>">
			    <button type="button"  class="delete">Delete</button></a></td>
			      <td><a href="Update.jsp?id=<%=rs.getString("id")%>">Update</a></td>
			    </tr>
			    
				
			
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
     

    