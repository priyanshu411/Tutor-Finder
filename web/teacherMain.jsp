<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
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
        if (userType.equals("Teacher") != true)
        {
            response.sendRedirect("login.jsp");
        }
    }
//    for data base
    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    String query1 = "select * from contact where Temail='" + email + "' and status=1";
    ResultSet data = db.getData(con, query1);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teacher Main</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a8a31e2970.js" crossorigin="anonymous"></script>
    </head>
    <body class="for-body">
        <%@include file="navbar/teacher_navbar.jsp"%>

        <!--accepted student request start-->
        <section>
            <div class="container mt-3">
                <div class="accordion" id="acceptStu">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <span class="me-2"><i class="fas fa-check"></i></span> Accepted students List
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#acceptStu">
                            <div class="accordion-body ">
                                <div class="row justify-content-center">

                                    <%  while (data.next())
                                        {

                                    %>
                                    <div class="col-md-5 mb-3">
                                        <div class="card shadow rounded-3 b-radius">
                                            <div class="card-header h5 text-white text-center bg-info b-t-radius">
                                                <span class="fa fa-user m-2"></span>
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-borderless fs-5">
                                                    <tbody>
                                                        <tr>
                                                            <td>Email</td>
                                                            <td class="text-info text-break"><%=data.getString("Semail")%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Date</td>
                                                            <td class="text-info"><%=data.getString("contact_date")%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Info</td>
                                                            <td class="text-info"><%=data.getString("contact_info")%></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="text-center"><button type="button" class="btn btn-outline-warning" value="<%=data.getString("Semail")%>" onclick="openModal(this.value)">Edit</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--accepted student request end-->

        <%            String query2 = "select u.name,u.email,s.pmobile,s.class from users u inner join student s on u.email=s.Semail "
                    + "where email in(select  Semail from contact where temail='" + email + "' and status=0)";
            data = db.getData(con, query2);
        %>
        <!--request section start-->
        <section> 
            <div class="container my-4">
                <h2 class="text-center text-info">Students Requests</h2>
                <div class="row justify-content-center">
                    <%
                        while (data.next())
                        {

                    %>
                    <div class="col-md-5 mb-3">
                        <div class="card shadow rounded-3 b-radius">
                            <div class="card-header text-uppercase h5 text-white text-center bg-info b-t-radius">
                                <span class="fa fa-user m-2"></span><%=data.getString("name")%>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless fs-5">
                                    <tbody>
                                        <tr>
                                            <th scope="col">Email</th>
                                            <td class="text-info text-break"><%=data.getString("email")%></td>
                                        </tr>
                                        <tr>
                                            <th scope="col">Parents contact</th>
                                            <td class="text-info"><%=data.getString("pmobile")%></td>
                                        </tr>
                                        <tr>
                                            <th scope="col">Class</th>
                                            <td class="text-info"><%=data.getString("class")%></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" class="text-center">
                                                <button type="button" class="btn btn-success" value="<%=data.getString("email")%>" onclick="openModal(this.value)">Accept</button>
                                                <button type="button" class="btn btn-danger" value="<%=data.getString("email")%>"  onclick="reject(this.value)">Reject</button>
                                            </td>
                                        </tr>        
                                    <tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%        }
                        con.close();

                    %>
                </div>
            </div>
        </section>
        <!-- request section end-->



        <!--contact info section start-->

        <div class="modal fade" id="contactInfo" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tittle">Contact Info</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form onsubmit="saveInfo()" id="form">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="date" class="form-label">Date</label>
                                <input type="datetime-local" class="form-control" id="date" required>
                            </div>
                            <div class="mb-3">
                                <label for="info" class="form-label">Contact Info</label>
                                <input type="text" class="form-control" id="info" placeholder="offline/online meeting info"  required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--contact info section end-->

        <!--javaScript files-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/teacherMain.js" type="text/javascript"></script>
    </body>
</html>
