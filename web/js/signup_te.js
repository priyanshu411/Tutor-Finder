//teacher signup js file
let name, email, address, city, landmark, pincode, pass, conPass, gender, quali, degree, coaching = "";

function validate() {

    event.preventDefault();
    name = document.getElementById("name").value;
    email = document.getElementById("email").value;
    address = document.getElementById("address").value;
    city = document.getElementById("city").value;
    landmark = document.getElementById("landmark").value;
    pincode = document.getElementById("pincode").value;
    pass = document.getElementById("password").value;
    conPass = document.getElementById("conPassword").value;
    quali = document.getElementById("quali").value;
    degree = document.getElementById("degree").value;
    coaching = document.getElementById("coa_name").value;
    gen = "";
    if (document.getElementById("f").checked)
        gen = "female";
    else if (document.getElementById("m").checked)
        gen = "male";

    if (name.charCodeAt(0) === 32 || address.charCodeAt(0) === 32 || city.charCodeAt(0) === 32 || pincode.charCodeAt(0) === 32
            || landmark.charCodeAt(0) === 32 || pass.charCodeAt(0) === 32 || conPass.charCodeAt(0) === 32 || quali == 0 ||
            degree === "")
    {
        message(" All fields are Mandatory");
    } else if (pass.length > 8 || conPass.length > 8 || pass.length < 5 || conPass.length < 5) {
        message(" password length should be 5-8");
        document.getElementById("password").focus();
    } else if (pass.localeCompare(conPass) != 0) {
        message(" password not match");
        document.getElementById("conPassword").focus();
    } else {
        //save detail
        console.log("call");
        console.log("name=" + name + "&email=" + email + "&gender=" + gen + "&address=" + address
                + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&password=" + pass
                + "&qualification=" + quali + "&degree=" + degree + "&coaching=" + coaching);
        save(name, email, gen, address, city, pincode, landmark, pass, quali, degree, coaching);
    }
}


//save detail
function save(name, email, gen, address, city, pincode, landmark, pass, quali, degree, coaching) {

    let req = new XMLHttpRequest();
    req.open("post", "user/teacher/te_signup_back.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("name=" + name + "&email=" + email + "&gender=" + gen + "&address=" + address
            + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&password=" + pass
            + "&qualification=" + quali + "&degree=" + degree + "&coaching=" + coaching);

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
                swal("warning", "Email already used", "warning");
            }

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