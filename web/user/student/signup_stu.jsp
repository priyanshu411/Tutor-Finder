<%@page import="database.DbConnect"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String pmobile = request.getParameter("pmobile");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String landmark = request.getParameter("landmark");
    String password = request.getParameter("password");
    String _class = request.getParameter("class");
    String board = request.getParameter("board");
    String medium = request.getParameter("medium");
    DbConnect db = new DbConnect();
    String searchQuery = "select *from users where email='" + email + "'";
    if (db.searchData(searchQuery) == false)
    {
        String query1 = "insert into users(email,name,userType,gender,address,city,landmark,pincode,password) values"
                + "('" + email + "','" + name + "','" + "student" + "','" + gender + "','" + address + "','" + city + "','" + landmark + "','" + pincode + "','" + password + "');";
        String query2 = "insert into student(Semail,pmobile,class,board,medium) values"
                + "('" + email + "','" + pmobile + "','" + _class + "','" + board + "','" + medium + "');";
        if (db.executeMyQuery(query1) && db.executeMyQuery(query2))
        {
            out.print("success");
        }
        else
        {
            out.print("error");
        }
    }
    else
    {
        out.print("warning");
    }

%>