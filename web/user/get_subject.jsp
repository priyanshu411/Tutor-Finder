<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<%

    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    String query = "select *from subject;";
    String email = (String) session.getAttribute("email");
    ResultSet data = db.getData(con, query);

    while (data.next())
    {
        String sub = data.getString("sub_id");
        String query2 = "select subject from teacher where Temail='" + email + "' and subject like '%(" + sub + ")%';";
        if (db.searchData(query2))
        {
%>

<div class="form-check form-check-inline" style="color: green">
    <input class="form-check-input checkS" type="checkbox" value="<%=data.getString("sub_id")%>" checked>
    *<%=data.getString("subject")%>
</div>
<%
}
else
{

%>
<div class="form-check form-check-inline">
    <input class="form-check-input checkS" type="checkbox" value="<%=data.getString("sub_id")%>">
    <%=data.getString("subject")%>
</div>
<%
        }
    }
    con.close();
%>