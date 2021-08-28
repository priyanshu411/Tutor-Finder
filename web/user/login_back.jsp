<%@page import="database.DbConnect"%>
<%@page import="java.sql.*"%>
<%
    DbConnect db = new DbConnect();
    Connection conn = db.openConnection();
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    String userType = request.getParameter("userType");
    String query = "select * from users where email='" + email + "'and password='" + pass + "'and userType='" + userType + "' ;";

    ResultSet data = db.getData(conn, query);
    if (data.next())
    {
        String name = data.getString("name");
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("userType", userType);
        conn.close();
        if (userType.equals("Student"))
        {
            response.sendRedirect("../studentMain.jsp");
        }
        else if (userType.equals("Teacher"))
        {
            response.sendRedirect("../teacherMain.jsp");
        }
        else
        {
            session.setAttribute("message", " Something went wrong try again");
            response.sendRedirect("../login.jsp");
        }
    }
    else
    {
        conn.close();
        session.setAttribute("message", " invalid Detail !");
        response.sendRedirect("../login.jsp");
    }
%>