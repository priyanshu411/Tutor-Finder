<%@page import="database.DbConnect"%>
<%
    String Semail=request.getParameter("Semail");
    String email = (String) session.getAttribute("email");
    DbConnect db = new DbConnect();
    String query = "delete from contact where Semail='" + Semail + "' and Temail='" + email + "';";
    if (db.executeMyQuery(query))
    {
        out.print("Student Request Rejected");
    }
    else
    {
        out.print("Something went wrong try again later..");
    }
%>
