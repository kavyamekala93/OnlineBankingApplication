$(document).ready(function () {
    $('#AddBtn').click(function () {
    var PayeeAccNo, PayeeNm, PayeeBranchNm;
    PayeeAccNo = $("#PayeeAccountNo").val();
    PayeeNm = $("#PayeeName").val();
    PayeeBranchNm = $("#PayeeBranchName").val();

     if (PayeeAccNo == '' && PayeeNm == '' && PayeeBranchNm == '') {

            alert("Enter All Payee Details");

            return false;

        }

         if (PayeeAccNo == '') {

            alert("Please Enter Payee Account Number");

            return false;

        }

         if (PayeeNm == '') {

            alert("Please Enter Payee Name");

            return false;

        }

         if (PayeeBranchNm == '') {

            alert("Please Enter Payee Branch Name");

            return false;

        }

        return true;
    })
});