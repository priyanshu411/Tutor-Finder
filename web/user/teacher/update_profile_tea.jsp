<%@page import="database.DbConnect"%>
<%
    String email = (String) session.getAttribute("email");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String landmark = request.getParameter("landmark");
    String qualification = request.getParameter("qualification");
    String degree = request.getParameter("degree");
    String coaching = request.getParameter("coaching");
    String query1 = "update users set name='" + name + "',gender='" + gender + "',address='" + address + "',city='" + city + "',"
            + "landmark='" + landmark + "',pincode='" + pincode + "'  where email='" + email + "' and userType='teacher';";
    String query2 = "update teacher set qualification='" + qualification + "',degree='"
            + degree + "',coaching='" + coaching + "' where Temail='" + email + "';";
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