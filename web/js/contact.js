//contact js file

function sendRequest(Temail) {
    let req = new XMLHttpRequest();
    req.open("post", "user/contactFor_stu_tea.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("Temail="+Temail);
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("msg").innerHTML=req.responseText;
        }

    };
}