//student signup signup js file
let flag;
let name, email, pmob, city, landmark, pincode, pass, cnpass, _class, board, medium, gen = "";
function check(val) {
    if (val >= 1 && val <= 12) {
        document.getElementById("board").disabled = false;
        flag = true;

    } else {
        document.getElementById("board").disabled = true;
        document.getElementById("board").value = "Select Board";
        flag = false;
    }
}
function validate() {

    event.preventDefault();
    name = document.getElementById("name").value;
    email = document.getElementById("email").value;
    pmob = document.getElementById("paMob-no").value;
    address = document.getElementById("address").value;
    city = document.getElementById("city").value;
    landmark = document.getElementById("landmark").value;
    pincode = document.getElementById("pincode").value;
    pass = document.getElementById("password").value;
    cnpass = document.getElementById("conPassword").value;
    _class = document.getElementById("class").value;
    board = document.getElementById("board").value;
    medium = document.getElementById("medium").value;
    gen = "";
    if (document.getElementById("f").checked)
        gen = "female";
    else if (document.getElementById("m").checked)
        gen = "male";

    if (name === "" || gen === "" || email === "" || pmob === "" || address === "" ||
            city === "" || pincode === "" || landmark === "" || pass === "" || cnpass === "" || _class === "Select Class" ||
            medium === "Select Medium" || (flag && board === "Select Board"))
    {
        message(" All fields are Mandatory");
    } else if (pmob.length !== 10) {
        message(" Mobile digit should be 10");
        document.getElementById("paMob-no").focus();
    } else if (pass.length > 8 || cnpass.length > 8 || pass.length < 5 || cnpass.length < 5) {
        message(" password length should be 5-8");
        document.getElementById("password").focus();
    } else if (pass.localeCompare(cnpass) != 0) {
        message(" password not match");
        document.getElementById("conPassword").focus();
    } else {
        //save detail
        console.log("call");
        save(name, email, pmob, gen, address, city, pincode, landmark, pass, _class, board, medium);
    }
}

function save(name, email, pmob, gen, address, city, pincode, landmark, pass, _class, board, medium) {

    let req = new XMLHttpRequest();
    req.open("post", "user/student/signup_stu.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("name=" + name + "&email=" + email + "&pmobile=" + pmob + "&gender=" + gen + "&address=" + address
            + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&password=" + pass
            + "&class=" + _class + "&board=" + board + "&medium=" + medium);
    console.log("name=" + name + "&email=" + email + "&pmobile=" + pmob + "&gender=" + gen + "&address=" + address
            + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&password=" + pass
            + "&class=" + _class + "&board=" + board + "&medium=" + medium);
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            let text = req.responseText.trim();
            if (text.localeCompare("success") == 0)
            {
                console.log(req.responseText);
                document.getElementById("form").reset();
                swal("Done", "Account create successfully", "success");
            } else if (text.localeCompare("error") == 0)
            {
                console.log(req.responseText);
                document.getElementById("form").reset();
                swal("Error", "Somthing went wrong plese try again", "error");
            } else if (text.localeCompare("warning") == 0)
            {
                console.log(req.responseText);
                swal("warning", "Email number already used", "warning");
            }

        }

    };
}

//function message
function message(msg)
{
    document.getElementById("msg-box").classList.remove("d-none");
    document.getElementById("msg-box").classList.add("d-block");
    document.getElementById("msg").innerHTML = msg;
}
