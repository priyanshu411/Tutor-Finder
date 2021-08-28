<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>

<%
    String email = (String) session.getAttribute("email");
    String query = "select t.Temail,u.name,u.address,u.city,u.landmark,u.pincode,u.gender,t.qualification,t.degree,t.subject,t.coaching,t.rating from teacher t "
            + "inner join users u on t.Temail= u.email "
            + "where u.email='" + email + "' and u.userType='teacher'";
    String query1 = "select cName from class where cId in(select class_id from teach where Temail='" + email + "')";
    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    ResultSet data = db.getData(con, query);
    ResultSet cname = db.getData(con, query1);
    data.next();
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
<table class="table table-borderless table-hover text-center">
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
    </tbody>
</table>
<%
    con.close();
%>