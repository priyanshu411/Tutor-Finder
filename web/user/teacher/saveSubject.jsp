<%@page import="database.DbConnect"%>
<%
    String subject = request.getParameter("subject");
    String email = (String) session.getAttribute("email");
    String query = "update teacher set subject='" + subject + "' where Temail='" + email + "'";
    DbConnect db = new DbConnect();
    if (db.executeMyQuery(query))
    {
        out.print("success");
    }
    else
    {
        out.print("error");
    }
%>