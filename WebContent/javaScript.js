function myFunction() {
    var pass1 = document.getElementById("pass1");
    var pass2 = document.getElementById("pass2");
  
    if (pass1.value != pass2.value) {
        alert("Passwords Do not match");
        document.getElementById("pass1").style.borderColor = "#E34234";
        document.getElementById("pass2").style.borderColor = "#E34234";
        return false;
    }
    else 
    {
        return true;
    }

}