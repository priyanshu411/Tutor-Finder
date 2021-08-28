//login javascript file
//validate login data
function validate()
{

    let email = document.getElementById("email").value;
    let pass = document.getElementById("password").value;
    let userType = document.getElementById("user").value;
    console.log(email + "," + pass + "," + userType);
    if (pass.charAt(0) == " " || email == "" || pass == "" || userType.localeCompare("Select User") == 0)
    {
        msgPrint(" All fields are Mandatory");
        return false;
    } else if (email.search("@")<=0)
    {
        msgPrint(" Enter valid email Address");
        return false;
    } else
    {
        return true;
    }

}
function msgPrint(msg) {
    document.getElementById("msg-box").classList.remove("d-none");
    document.getElementById("msg-box").classList.add("d-block");
    document.getElementById("msg").innerHTML = msg;

}
