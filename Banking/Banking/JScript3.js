$(document).ready(function () {
    $('#Register').click(function () {
        var AccNo, Openamt, OpenamtExp, Opendt, BranchN;

        AccNo = $("#AccountNo").val();
        Openamt = $("#OpeningAmount").val();
        OpenamtExp = /^([0-9])+$/;
        Opendt = $("#datepicker").val();
        BranchN = $("#ddlBranchName").val();
        


        if (AccNo == '' && Openamt == '' && Opendt == '' && BranchN == '--Select--') {

            alert("Enter All Fields");

            return false;

        }

        if (AccNo == '') {

            alert("Please Enter Account Number");

            return false;

        }

        if (Openamt == '') {

            alert("Please Enter Opening Amount");

            return false;

        }

        if (!OpenamtExp.test(Openamt)) {

            alert("Please enter numbers only");

            return false;


        }

        if (Opendt == '') {

            alert("Please Select Date ");

            return false;

        }
        if (BranchN == '--Select--') {

            alert("Please Select Branch");

            return false;

        }
      
        return true;
    })
});
