<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<%
    String tempSearchby = request.getParameter("searchby");
    String value = request.getParameter("value");
    String searchby = tempSearchby.toLowerCase();
    String email = (String) session.getAttribute("email");
    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    String queryCid = "select cId from class where cName=(select class from student where Semail='" + email + "')";
    ResultSet data;
    data = db.getData(con, queryCid);

    data.next();
    String cId = data.getString("cId");
    String queryTeacher = "select email,name,address,city,landmark,pincode from users "
            + "where " + searchby + " like '%" + value + "%' and email in(select Temail from teach where class_id=" + cId + ")";
    data = db.getData(con, queryTeacher);
    int i = 0;
    while (data.next())
    {
        i++;
%>

<div class="col-lg-5 my-2">
    <div class="card shadow  b-radius">
        <div class="card-header text-uppercase h3 text-white text-center bg-info b-t-radius">
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
                        <th scope="col">Address</th>
                        <td class="text-info"><%=data.getString("address")%></td>
                    </tr>
                    <tr>
                        <th scope="col">City</th>
                        <td class="text-info"><%=data.getString("city")%></td>
                    </tr>
                    <tr>
                        <th scope="col">Landmark</th>
                        <td class="text-info"><%=data.getString("landmark")%></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center"> <a href="contact.jsp?Temail=<%=data.getString("email")%>"  class="btn  btn-outline-primary">Contact</a></td>
                    </tr>        
                <tbody>
            </table>
        </div>
    </div>
</div>
<%        }
    con.close();
    if (i == 0)
    {

%>

<h1 class="text-center">No teacher Found</h1>

<%   }
%>