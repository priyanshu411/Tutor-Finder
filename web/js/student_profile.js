//student profile js file
//get student profile data
function student_data() {
    let req = new XMLHttpRequest();
    req.open("post", "user/student/stu_profile_data.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send();
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("stu-data").innerHTML = req.responseText;
        }

    };
}

//get profile data
student_data();

//update profile validate
function validate() {

    event.preventDefault();
    let name = document.getElementById("name").value;
    let pmobile = document.getElementById("paMob-no").value;
    let address = document.getElementById("address").value;
    let city = document.getElementById("city").value;
    let landmark = document.getElementById("landmark").value;
    let pincode = document.getElementById("pincode").value;
    let gender = "";
    if (document.getElementById("m").checked) {
        gender = "male";
    } else if (document.getElementById("f").checked) {
        gender = "female";
    }

    if (name.charCodeAt(0) === 32 || pmobile.length != 10 || address.charCodeAt(0) === 32 || city.charCodeAt(0) === 32 ||
            landmark.charCodeAt(0) === 32 || pincode.charCodeAt(0) === 32) {
        message(" Fill all fields");
    } else {
        updateProfile(name, pmobile, address, city, landmark, pincode, gender);
    }
}

//update profile
function updateProfile(name, pmobile, address, city, landmark, pincode, gender) {
    console.log("name=" + name + "&pmobile=" + pmobile + "&address=" + address + "&city=" + city +
            "&landmark=" + landmark + "&pincode" + pincode + "$gender=" + gender);

    let req = new XMLHttpRequest();
    req.open("post", "user/student/update_profile_stu.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("name=" + name + "&pmobile=" + pmobile + "&address=" + address + "&city=" + city +
            "&landmark=" + landmark + "&pincode=" + pincode + "&gender=" + gender);

    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            message(req.responseText);
//            update profile
            student_data();
        }

    };

}


//message
function message(msg) {
    document.getElementById("msg-box").classList.remove("d-none");
    document.getElementById("msg").innerHTML = msg;
}