
//modal object
let Class = new bootstrap.Modal(document.getElementById('add-class'), {
    backdrop: "static",
    keyboard: false
});
let subject = new bootstrap.Modal(document.getElementById('add-subject'), {
    backdrop: "static",
    keyboard: false
});


//get teacher  data
function teacher_data() {
    let req = new XMLHttpRequest();
    req.open("post", "user/teacher/tea_profile_data.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send();
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("tea-data").innerHTML = req.responseText;
        }

    };
}


//get class
function getClass() {

    let req = new XMLHttpRequest();
    req.open("post", "user/get_class.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send();
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("class_data").innerHTML = req.responseText;
        }

    };
}
function getSubject() {

    let req = new XMLHttpRequest();
    req.open("post", "user/get_subject.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send();
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("subject_data").innerHTML = req.responseText;
        }

    };
}

//get subject and class
teacher_data();
getClass();
getSubject();

//save Class
function saveClass() {

    let cl = "";
    let obj = document.getElementsByClassName("checkC");

    for (let i = 0; i < obj.length; i++) {

        if (obj[i].checked && obj[i].disabled === false) {
            cl = cl + (obj[i].value) + ",";
        }
    }
    console.log(cl);
    if (cl.length > 0) {
        let req = new XMLHttpRequest();
        req.open("post", "user/teacher/saveClass.jsp", true);
        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        req.send("class=" + cl);
        console.log("2");
        req.onreadystatechange = function ()
        {
            if (req.readyState === 4 && req.status === 200)
            {
                let text = req.responseText.trim();
                console.log("text");
                if (text === "success")
                {
                    swal("Done", "Class Added", "success");
                } else if (text === "error") {
                    swal("Error", "Somthing went wrong plese try again", "error");
                }
                Class.hide();
                getClass();
            }

        };

    }
}

//save subject

function saveSubject() {

    let sub = "";
    let obj = document.getElementsByClassName("checkS");

    for (let i = 0; i < obj.length; i++) {

        if (obj[i].checked) {
            sub = sub + "(" + (obj[i].value) + ")";
        }
    }
    console.log(sub);
    let req = new XMLHttpRequest();
    req.open("post", "user/teacher/saveSubject.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("subject=" + sub);
    console.log("2");
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            let text = req.responseText.trim();
            console.log(text);
            if (text === "success")
            {
                swal("Done", "Subject Updated", "success");
            } else if (text === "error") {
                swal("Error", "Somthing went wrong plese try again", "error");
            }
            subject.hide();
            getSubject();
        }

    };
}

//delete class
function deleteClass(classId) {
    let req = new XMLHttpRequest();
    req.open("post", "user/teacher/deleteClass.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("classId=" + classId);
    console.log(classId);
    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            let text = req.responseText.trim();
            console.log(text);
            if (text === "success")
            {
                swal("Done", "Class Delete", "success");
            } else if (text === "error") {
                swal("Error", "Somthing went wrong plese try again", "error");
            }
            Class.hide();
            getClass();
        }

    };

}

//update profile
function validate() {

    event.preventDefault();
    name = document.getElementById("name").value;
    address = document.getElementById("address").value;
    city = document.getElementById("city").value;
    landmark = document.getElementById("landmark").value;
    pincode = document.getElementById("pincode").value;
    quali = document.getElementById("quali").value;
    degree = document.getElementById("degree").value;
    coaching = document.getElementById("coa_name").value;
    gen = "";
    if (document.getElementById("f").checked)
        gen = "female";
    else if (document.getElementById("m").checked)
        gen = "male";

    if (name.charCodeAt(0) === 32 || gen.charCodeAt(0) === 32 || address.charCodeAt(0) === 32 ||
            city.charCodeAt(0) === 32 || pincode.charCodeAt(0) === 32 || landmark.charCodeAt(0) === 32 ||
            quali === "0" || degree.charCodeAt(0) === 32)
    {
        message(" All fields are Mandatory");
    } else {
        //save detail
        console.log("call");
        console.log("name=" + name + "&gender=" + gen + "&address=" + address
                + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&qualification=" + quali +
                "&degree=" + degree + "&coaching=" + coaching);
        update(name, gen, address, city, pincode, landmark, quali, degree, coaching);
    }
}


//update profile

function update(name, gen, address, city, pincode, landmark, quali, degree, coaching) {
    let req = new XMLHttpRequest();
    req.open("post", "user/teacher/update_profile_tea.jsp", true);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send("name=" + name + "&gender=" + gen + "&address=" + address
            + "&city=" + city + "&pincode=" + pincode + "&landmark=" + landmark + "&qualification=" + quali +
            "&degree=" + degree + "&coaching=" + coaching);

    req.onreadystatechange = function ()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            document.getElementById("msg-box").classList.remove("alert-danger");
            document.getElementById("msg-box").classList.add("alert-success");
            message(req.responseText);
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