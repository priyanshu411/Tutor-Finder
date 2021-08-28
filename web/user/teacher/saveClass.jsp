<%@page import="database.DbConnect"%>
<%
    String email = (String) session.getAttribute("email");
    String temp = request.getParameter("class");
    String c[] = temp.split(",");
    int count = 0;
    DbConnect db = new DbConnect();
    for (int i = 0; i < c.length; i++)
    {
        int cid = Integer.parseInt(c[i]);
        boolean flag = db.executeMyQuery("insert into teach(class_id,Temail) values(" + cid + ",'" + email + "');");
        if (flag)
        {
            count++;
        }
    }

    if (count == c.length)
    {
        out.print("success");
    }
    else
    {
        out.print("error");
    }
%>