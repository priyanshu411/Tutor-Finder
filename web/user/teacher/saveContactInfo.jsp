<%@page import="database.DbConnect"%>
<%
    String date = request.getParameter("date");
    String info = request.getParameter("metinfo");
    String email = (String) session.getAttribute("email");
    String Semail = request.getParameter("semail");
    String query = "update  contact set contact_date = convert(smalldatetime,'" + date + "'),contact_info='" + info + "',status=1 "
            + "where Semail='" + Semail + "' and Temail='" + email + "';";
    DbConnect db = new DbConnect();
    if (db.executeMyQuery(query))
    {
        out.print("information sent succesfully");
    }
    else
    {
        out.print("something went wrong try again");
    }
%>
