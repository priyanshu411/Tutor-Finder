//teacher contact info js page
let Semail;
//modal object
let info = new bootstrap.Modal(document.getElementById("contactInfo"),
        {
            backdrop: "static",
            keyboard: false
        });

//contact information save
function openModal(email) {
    info.show();
    Semail = email;
    document.getElementById("tittle").innerHTML = "Contact info" + " (" + Semail + ")";
}

//save contact info
function saveInfo() {
    event.preventDefault();
    let date = document.getElementById("date").value;
    let metinfo = document.getElementById("info").value;
    if (date == "" || metinfo == "" || metinfo.charAt(0) === " ") {
        alert("fill all fields");
    } else {
//        save info
        date = date + ":00"; //for database
        let req = new XMLHttpRequest();
        req.open("post", "user/teacher/saveContactInfo.jsp", true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        req.send("semail=" + Semail + "&date=" + date + "&metinfo=" + metinfo);
        req.onreadystatechange = function ()
        {
            if (req.readyState === 4 && req.status === 200)
            {
                alert(req.responseText);
                info.hide();
                document.getElementById("form").reset();
            }

        };
    }
}


//reject request()
function reject(StudentEmail) {
    let req = new XMLHttpRequest();
    req.open("post", "user/delete_student-request.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("Semail=" + StudentEmail);
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            alert(req.responseText);
        }

    };
}