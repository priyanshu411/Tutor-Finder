<%@page import="database.DbConnect"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String landmark = request.getParameter("landmark");
    String password = request.getParameter("password");
    String qualification = request.getParameter("qualification");
    String degree = request.getParameter("degree");
    String coaching = request.getParameter("coaching");

    DbConnect db = new DbConnect();
    String searchQuery = "select *from users where email='" + email + "'";
    if (db.searchData(searchQuery) == false)
    {
        String query1 = "insert into users(email,name,userType,gender,address,city,landmark,pincode,password) values"
                + "('" + email + "','" + name + "','" + "teacher" + "','" + gender + "','" + address + "','" + city + "','" + landmark + "','" + pincode + "','" + password + "');";
        String query2 = "insert into teacher(Temail,qualification,degree,coaching) values"
                + "('" + email + "','" + qualification + "','" + degree + "','" + coaching + "');";
        System.out.println(query1);
        System.out.println(query2);
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