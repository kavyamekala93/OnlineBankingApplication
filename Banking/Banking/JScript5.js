$(document).ready(function () {
    $('#Submit').click(function (event) {
        //        var msg = window.prompt("Transaction Successful.");
        var Balance, Amount, Balanceint, Amountint, Amountexp;
        //var Balance, Amount;
        Balance = $("#Balance").val();
        Amount = $("#Amount").val();
        Balanceint = parseFloat(Balance.toString());
        Amountint = parseFloat(Amount.toString());
        Amountexp = /^([0-9])+$/;

        if (Balanceint <= 0) {
            alert("Your Balance is Rs.0, Cannot proceed to withdrawal and transfer");
            return false;
        }
        //        return true;
        if (Balanceint < Amountint) {
            alert("Insufficient Balance");
            return false;
        }
        if (Amountint <= 0) {
            alert("Please insert non-zero positive amount");
            return false;
        }
        if (Amount == '') {
            alert("Please enter amount");
            return false;
        }
       
        if (!Amountexp.test(Amountint)) {

            alert("Insert Numericals");

            return false;

        }

        else {
            alert("TRANSACTION SUCCESSFUL");
        }


    })
});
