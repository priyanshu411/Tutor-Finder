//student change password js file

function valid() {
    event.preventDefault();
    let currentPass = document.getElementById("currentPassword").value;
    let newPass = document.getElementById("newPassword").value;
   
    if (currentPass.charCodeAt(0) === 32 || currentPass.charCodeAt(0) === 32) {
        message(" Fill all fields & spaces not allowed");
        document.getElementById("currentPassword").focus();

    } else if (currentPass.length > 8 || newPass.length > 8 || currentPass.length < 5 || newPass.length < 5) {
        message(" password length should be 5-8 digit");
        document.getElementById("currentPassword").focus();
    } else {
        changePass(currentPass,newPass);
    }
}


//change password

function changePass(currentPass,newPass){
    let req = new XMLHttpRequest();
    req.open("post", "user/student/stu_change_pass.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("curr="+currentPass+"&new="+newPass);
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            message(req.responseText);
            document.getElementById("form").reset();
        }

    };
}

//message
function message(msg)
{
    document.getElementById("msg-box").classList.remove("d-none");
    document.getElementById("msg-box").classList.add("d-block");
    document.getElementById("msg").innerHTML = msg;
}