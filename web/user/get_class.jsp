<%@page import="java.sql.*"%>
<%@page import="database.DbConnect"%>
<h5 class="mb-2" id="staticBackdropLabel">* Already added</h5>
<%

    DbConnect db = new DbConnect();
    Connection con = db.openConnection();
    String query = "select *from class;";
    String email = (String) session.getAttribute("email");
    ResultSet data = db.getData(con, query);

    while (data.next())
    {
        int id = data.getInt("cId");
        String query2 = "select * from teach where class_id=" + id + " and Temail='" + email + "';";
        if (db.searchData(query2))
        {
%>

<button type="button" class="btn btn-outline-danger btn-sm mb-1 border-0" onclick="deleteClass(this.value)" value="<%=data.getString("cId")%>"><span><i class="fas fa-trash"></i></span> <%=data.getString("cName")%></button>

<%
}
else
{

%>
<div class="form-check form-check-inline">
    <input class="form-check-input checkC" type="checkbox" value="<%=data.getString("cId")%>">
    <%=data.getString("cName")%>
</div>
<%
        }
    }
    con.close();
%>