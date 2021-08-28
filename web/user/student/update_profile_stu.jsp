<%@page import="database.DbConnect"%>
<%
    String name = request.getParameter("name");
    String pmobile = request.getParameter("pmobile");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String landmark = request.getParameter("landmark");
    String pincode = request.getParameter("pincode");
    String gender = request.getParameter("gender");

    String email = (String) session.getAttribute("email");
    String query1 = "update users set name='" + name + "',gender='" + gender + "',address='" + address + "',city='" + city + "',landmark='"
            + landmark + "',pincode='" + pincode + "' where email='" + email + "' and userType='student' ;";
    String query2 = "update student set pmobile='" + pmobile + "' where Semail='" + email + "' ;";
    DbConnect db = new DbConnect();
    if (db.executeMyQuery(query1) && db.executeMyQuery(query2))
    {

        out.print("Update successfully");
    }
    else
    {
        out.print("Something went wrong try again later..");
    }


%>