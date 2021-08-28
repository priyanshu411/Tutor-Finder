//teacher search file

function search_teacher() {
    event.preventDefault();
    console.log("run event");
    let searchby = document.getElementById("search").value;
    let value = document.getElementById("se_data").value;
    if (value === "" || value.charCodeAt(0) == 32)
    {
        document.getElementById("se_data").focus();
    } else {
        
//        search data
        let req = new XMLHttpRequest();
        req.open("post", "user/student/search_teacher.jsp", true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        req.send("searchby="+searchby+"&value="+value);
        console.log("2");
        req.onreadystatechange = function ()
        {
            if (req.readyState === 4 && req.status === 200)
            {
                document.getElementById("teacher").innerHTML = req.responseText;
            }

        };
    }
}
function placeholder(value) {
    document.getElementById("se_data").placeholder = "Enter " + value;
}

