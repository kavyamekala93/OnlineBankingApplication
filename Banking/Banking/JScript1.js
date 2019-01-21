$(document).ready(function () {
    $('#Next').click(function () {
        var Name, UserID, Password, Confirm, EmailID, EmailExp, Phone, PhoneExp, Address, Occupation, Income, IncomeExp, Gender, Age, AgeExp, SecQ, SecAns;

        Name = $("#Name").val();
        UserID = $("#UserID").val();
        Password = $("#Pwd").val();
        Confirm = $("#ConfrmPwd").val();
        EmailID = $("#EmailID").val();
        EmailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;
        Phone = $("#PhoneNo").val();
        PhoneExp = /^([0-9])+$/;
        Address = $("#Address").val();
        Occupation = $("#Occupation").val();
        Income = $("#YearlyIncome").val();
        IncomeExp = /^([0-9])+$/;
        Gender = $("#Gender").val();
        Age = $("#Age").val();
        AgeExp = /^([0-9])+$/;
        SecQ = $("#Securityquestion").val();
        SecAns = $("#txtanswer").val();


        if (Name == '' && UserID == '' && Password == '' && Confirm == '' && EmailID == '' && Phone == '' && Address == '' && Occupation == '' && Income == '' && Gender == '--Select--' && Age == '' && SecQ == '--Select--' && SecAns == '') {

            alert("Enter All Fields");

            return false;

        }

        if (Name == '') {

            alert("Please Enter User Name");

            return false;

        }

        if (UserID == '') {

            alert("Please Enter UserID");

            return false;

        }

        if (Password == '') {

            alert("Please Enter Password");

            return false;

        }
        if (Confirm == '') {

            alert("Please Confirm Password");

            return false;

        }
        if (Password != Confirm) {

            alert("Passwords do not match");

            return false;

        }
        if (EmailID == '') {

            alert("Please Enter EmailID");

            return false;

        }

        if (!EmailExp.test(EmailID)) {

            alert("Invalid Email Id");

            return false;


        }
        if (Phone == '') {

            alert("Please Enter Phone Number");

            return false;

        }
        if (!PhoneExp.test(Phone)) {

            alert("Invalid Phone Number");

            return false;


        }
        if (Address == '') {

            alert("Please enter Address");

            return false;

        }
        if (Occupation == '') {

            alert("Please enter Occupation");

            return false;

        }
        if (Income == '') {

            alert("Please enter Yearly Income.");

            return false;

        }
        if (!IncomeExp.test(Income)) {

            alert("Please enter numbers only");

            return false;


        }

        if (Gender == '--Select--') {

            alert("Please enter Gender");

            return false;

        }
        if (Age == '') {

            alert("Please enter Age");

            return false;

        }
        if (!AgeExp.test(Age)) {

            alert("Please enter your correct age");

            return false;


        }
        if (SecQ == '--Select--') {

            alert("Please select Security Question");

            return false;

        }
        if (SecAns == '') {

            alert("Please enter answer");

            return false;

        }
        return true;
    })
});
