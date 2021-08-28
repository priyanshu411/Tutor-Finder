<%@page import="database.DbConnect"%>
<%

    String currPass = request.getParameter("curr");
    String newPass = request.getParameter("new");
    String email = (String) session.getAttribute("email");
    String tempQuery = "select email from users where email='" + email + "' and password='" + currPass + "' and usertype='student';";
    DbConnect db = new DbConnect();
    if (db.searchData(tempQuery))
    {
        String query = "update users set password='" + newPass + "' where email='" + email + "';";
        if (db.executeMyQuery(query))
        {
            out.print("Password Change Succesfully");
        }
        else
        {
            out.print("Something went wrong,Try Again...");
        }
    }
    else
    {
        out.print(" Current Password is wrong");
    }


%>
