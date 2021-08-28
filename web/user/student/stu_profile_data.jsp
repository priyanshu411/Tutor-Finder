<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>

<%
    String email = (String) session.getAttribute("email");
    String query = "select u.name,s.Semail,s.pmobile,u.address,u.city,u.landmark,u.pincode,u.gender,s.class,s.board,s.medium from student s "
            + "inner join users u on s.Semail= u.email where u.email='" + email + "' and u.userType='student'";
    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    ResultSet data = db.getData(con, query);
    data.next();
%>

<table class="table table-borderless table-hover text-center">
    <thead>
        <tr>
            <th scope="col" colspan="2"><h1>Profile</h1></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">Email</th>
            <td><%= data.getString("Semail")%></td>
        </tr>
        <tr>
            <th scope="row">Name</th>
            <td><%= data.getString("name")%></td>
        </tr>
        <tr>
            <th scope="row">Parents Contact</th>
            <td><%= data.getString("pmobile")%></td>
        </tr>
        <tr>
            <th scope="row">Address</th>
            <td><%= data.getString("address")%></td>
        </tr>
        <tr>
            <th scope="row">City</th>
            <td><%= data.getString("city")%></td>
        </tr>
        <tr>
            <th scope="row">Landmark</th>
            <td><%= data.getString("landmark")%></td>
        </tr>
        <tr>
            <th scope="row">Pincode</th>
            <td><%= data.getString("pincode")%></td>
        </tr>
        <tr>
            <th scope="row">Gender</th>
            <td><%= data.getString("gender")%></td>
        </tr>
        <tr>
            <th scope="row">Class</th>
            <td><%= data.getString("class")%></td>
        </tr>
        <tr>
            <th scope="row">Board</th>
            <td><%= data.getString("board")%></td>
        </tr>
        <tr>
            <th scope="row">Medium</th>
            <td><%= data.getString("medium")%></td>
        </tr>
    </tbody>
</table>
<%
    con.close();
%>