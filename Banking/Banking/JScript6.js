$(document).ready(function () {
    $('#Submit').click(function (event) {

        var Amount, Amountft;
        Amount = $("#Amount").val();
        Amountft = parseFloat(Amount.toString());
        Amountexp = /^([0-9])+$/;


        if (Amountft <= 0) {
            alert("Please insert non-zero positive amount");
            return false;
        }
        if (Amount == '') {
            alert("Please enter amount")
            return false;
        }

        if (!Amountexp.test(Amountft)) {

            alert("Insert Numericals");

            return false;


        }
        
        
        else {

            alert("TRANSACTION SUCCESSFUL");
        }
    })
});