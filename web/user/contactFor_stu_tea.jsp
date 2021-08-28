<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<%
    String Temail = request.getParameter("Temail");
    String Semail = (String) session.getAttribute("email");
    int status = 0;
    String query = "insert into contact(Temail,Semail,status) values('" + Temail + "','" + Semail + "'," + status + ")";
    DbConnect db = new DbConnect();
    if (db.executeMyQuery(query))
    {
        out.print(" Your Request was sent Check in Profile Page");
    }
    else
    {
        out.print(" Something went wrong try again");
    }

%>