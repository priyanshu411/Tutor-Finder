<%@page import="database.DbConnect"%>
<%
    String Temail = (String) session.getAttribute("email");
    String classId = request.getParameter("classId");
    int cId = Integer.parseInt(classId);
    String query = "delete from teach where class_id=" + cId + " and Temail='" + Temail + "'";
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