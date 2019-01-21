<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Banking.Home" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
        
        <ContentTemplate>
    <style type="text/css">
    .style13
    {
        width: 500px;
    }
    .style14
    {
        width:600px;
        color: #FFFFFF;
    }
    .style16
    {
        font-size: xx-large;
    }
    .style17
    {
    }
    .style18
    {
        width: 383px;
        height: 87px;
    }
    .style19
    {
        width: 383px;
        height: 87px;
    }
        .style24
        {
            height: 90px;
        }
        .style25
        {
            width: 383px;
            height: 98px;
        }
        .style26
        {
            height: 98px;
        }
        .style27
        {
            width: 381px;
            height: 102px;
        }
        .style28
        {
            height: 102px;
        }
        </style>
<%--</asp:Content>--%>

    <table cellpadding="4" cellspacing="4" class="style13">
    <%--<tr> <td><asp:Image ID="Image2" runat="server" 
                Height="160px" ImageUrl="~/Images/bank-icon-256x256.png" 
                style="margin-left: 300px" Width="277px" /></td></tr>--%>
    <tr>
    <td class="style14" colspan="2">
    <h1>
        <asp:Label ID="LblName" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Label" ForeColor="Black"></asp:Label>
        </h1> 
    
   
       <%-- <td class="style14" colspan="0.5" 
            style="font-family: fantasy; font-weight: 700; font-size: large">--%>
           
        </td>
    </tr>
    <tr>
        <td class="style18">
            <asp:Label ID="AccNo" runat="server" 
                style="text-align: center; margin-left: 79px; font-size: xx-large; background-color: #6600FF" 
                Text="ACCOUNT NO : " BackColor="Aqua" ForeColor="White"></asp:Label>
        </td>
        <td class="style19">
            <asp:TextBox ID="AccountNo" runat="server" Height="39px" 
                style="margin-left: 79px; background-color: #FFFF" Width="235px" ReadOnly="True" 
                ontextchanged="AccountNo_TextChanged" ForeColor="Black"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style25">
            <asp:ImageButton ID="ChkBal" runat="server" 
                ImageUrl="~/Images/CheckBalance2.png" style="margin-left: 79px" 
                Width="250px" onclick="ChkBal_Click1" />
        </td>
        <td class="style25">
            <asp:ImageButton ID="Deposit" runat="server" 
                ImageUrl="~/Images/paypal-deposit-button1.gif" 
                style="text-align: center; margin-left: 79px" Width="250px" onclick="Deposit_Click1" 
                />
        </td>
    </tr>
    <tr>
        <td class="style25">
            <asp:ImageButton ID="Withdraw" runat="server" Height="76px" 
                ImageUrl="~/Images/withdraw-button.png" style="margin-left: 79px" 
                Width="250px" onclick="Withdraw_Click1" />
        </td>
        <td class="style25">
            <asp:ImageButton ID="Transfer" runat="server" Height="82px" 
                ImageUrl="~/Images/banktransferbutton.gif" style="margin-left: 79px" 
                Width="250px" onclick="Transfer_Click1" />
        </td>
    </tr>
    <tr>
        <td class="style25" colspan="2">
            <asp:ImageButton ID="Statement" runat="server" Height="92px" 
                ImageUrl="~/Images/My-Account-Button.png" Width="726px" 
                onclick="Statement_Click1" />
        </td>
    </tr>
    <tr>
        <td class="style25">
        <asp:ImageButton ID="Interest" runat="server" Height="80px" 
                ImageUrl="~/Images/interestcal.png" 
                style="margin-left: 79px; margin-bottom: 0px;" Width="250px" Visible="False"
                onclick="Interest_Click1" />
          </td>
          <td>
          <asp:Label ID="Interestmessage" runat="server" Text="Calculation Successful!!!" style="margin-left: 79px; font-size:x-large;"
                Visible="False"></asp:Label>
          </td>
    </tr>
    <tr>
        <td class="style25" colspan="2">
            <asp:ImageButton ID="Register" runat="server" 
                ImageUrl="~/Images/new-user-button.png" Width="720px" Visible="False" 
                onclick="Register_Click1" Height="75px" />
        </td>
        
    </tr>

    <tr>
    <td class="style25">
            <asp:ImageButton ID="Sum" runat="server" Height="76px" 
                ImageUrl="~/Images/sum.jpg" style="margin-left: 79px" 
                Visible="False"  Width="250px" onclick="Sum_Click" />
        </td>
        <td class="style19">
            <asp:TextBox ID="Sum1" runat="server" Height="39px" 
                style="margin-left: 79px; background-color: #FFFF" Width="235px" ReadOnly="True" 
                 Visible="False"  ForeColor="Black"></asp:TextBox>
        </td>

    </tr>
</table>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>