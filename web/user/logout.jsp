<!--logout-->
<%

    session.removeAttribute("name");
    session.removeAttribute("email");
    session.removeAttribute("userType");

//send to home page
    response.sendRedirect("../home.jsp");

%>
