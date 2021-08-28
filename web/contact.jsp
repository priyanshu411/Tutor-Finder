<%
    String name = (String) session.getAttribute("name");
    String userType = (String) session.getAttribute("userType");
    String email = (String) session.getAttribute("email");
    if (name == null || userType == null || email == null)
    {
        response.sendRedirect("login.jsp");
    }
    else if (userType != null)
    {
        if (userType.equals("Student") != true)
        {
            response.sendRedirect("login.jsp");
        }
    }
%>

<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">
        <%@include file="navbar/student_navbar.jsp"%>

        <%
            String Temail = request.getParameter("Temail");
            String query = "select t.Temail,u.name,u.address,u.city,u.landmark,u.pincode,u.gender,t.qualification,t.degree,t.subject,t.coaching,t.rating from teacher t "
                    + "inner join users u on t.Temail= u.email "
                    + "where u.email='" + Temail + "' and u.userType='teacher'";
            String query1 = "select cName from class where cId in(select class_id from teach where Temail='" + Temail + "')";
            DbConnect db = new DbConnect();
            Connection con = db.openConnection();
            ResultSet data = db.getData(con, query);
            ResultSet cname = db.getData(con, query1);
            if (data.next())
            {
                boolean flag = false;
                String temp = data.getString("subject");
                String tempsub = "";
                String sub[] = null;
                if (temp != null)
                {
                    tempsub = (temp.replace("(", "")).replace(")", ",");
                    sub = tempsub.split(",");
                    flag = true;
                }
        %>
        <section> 
            <div class="container my-4">
                <div class="row justify-content-center">
                    <div class=" col-md-5 b-radius shadow bg-light">
                        <table class="table table-hover text-center">
                            <thead>
                                <tr>
                                    <th scope="col" colspan="2"><h2><i class="fas fa-user"></i></h2></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%= data.getString("Temail")%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Name</th>
                                    <td class="text-uppercase"><%= data.getString("name")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Address</th>
                                    <td class="text-uppercase"><%= data.getString("address")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">City</th>
                                    <td class="text-uppercase"><%= data.getString("city")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">landmark</th>
                                    <td class="text-uppercase"><%= data.getString("landmark")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Pincode</th>
                                    <td class="text-uppercase"><%= data.getString("pincode")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td class="text-uppercase"><%= data.getString("gender")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Qualification</th>
                                    <td class="text-uppercase"><%= data.getString("qualification")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Degree</th>
                                    <td class="text-uppercase"><%= data.getString("degree")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Class</th>
                                    <td class="text-uppercase">
                                        <%
                                            while (cname.next())
                                            {
                                        %>
                                        <%= cname.getString("cName")%>,
                                        <%
                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Subjects</th>
                                    <td class="text-uppercase">
                                        <%
                                            if (flag)
                                            {
                                                for (int i = 0; i < sub.length; i++)
                                                {
                                                    int subid = Integer.parseInt(sub[i]);
                                                    ResultSet rs = db.getData(con, "select subject from subject where sub_id=" + subid + "");
                                                    rs.next();
                                        %>
                                        <%= rs.getString("subject")%>,
                                        <%
                                                }
                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Coaching Name</th>
                                    <td class="text-uppercase"><%= data.getString("coaching")%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Rating</th>
                                    <td class="text-uppercase"><%= data.getString("rating")%></td>
                                </tr>
                                <tr>
                                    <%
                                        if (db.searchData("select * from contact where Temail='" + Temail + "' and Semail='" + email + "'"))
                                        {
                                    %>

                                    <td colspan="2" id="msg" class="text-uppercase text-info">
                                        Your Request was sent Check in Profile Page
                                    </td>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <td colspan="2" id="msg" class="text-uppercase text-info ">
                                        <button onclick="sendRequest('<%= data.getString("Temail")%>')" class="btn btn-info">Send Request TO Contact</button>
                                    </td>
                                    <%
                                        }
                                    %>
                                </tr>
                            </tbody>
                        </table>
                        <%   }
                            else
                            {
                                out.print("<h2>No data</21>");
                            }
                            con.close();
                        %>

                    </div>
                </div>
            </div>
        </section>

        <!--javaScript files-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--my js file-->
        <script src="js/contact.js" type="text/javascript"></script>
    </body>
</html>