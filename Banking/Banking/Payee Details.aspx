<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payee Details.aspx.cs" Inherits="Banking.Payee_Details" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>--%>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
        
        <ContentTemplate>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="JScript8.js" type="text/javascript"></script>

<style type="text/css">
        .style1
        {
            width: 700px;
            height: 364px;
        }
        .style2
        {
            width: 500px;
        }
        .style3
        {
            width: 250px;
        }
        .style6
        {
            width: 330px;
            height: 50px;
        }
         .style10
        {
           
            width: 330px;
            height: 50px;
        }
    </style>


    <table class="style1">
    <tr><td class="style3" colspan="2"><h1><asp:Label ID="LblName" runat="server" style="text-align: center; margin-left: 10px; ForeColor=Black" 
        Text="Label" ForeColor="Black"></asp:Label></h1></td></tr>
   <tr><td><h2 class="style2"><asp:Label ID="LblNames" runat="server" style="text-align: center; margin-left: 200px; ForeColor=Black" 
        Text="Enter the details of Payee" ForeColor="Black"></asp:Label></h2></td></tr>

    <tr><td class="style10"><asp:Label ID="Name" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Your Account No: " ForeColor="Black"></asp:Label></td>

    <td class="style6">
        <asp:TextBox ID="PayerAccountNo" runat="server" 
            ReadOnly="True" ontextchanged="MyAccountNo_TextChanged"
            style="margin-right:79px"></asp:TextBox></td></tr>

    <tr><td class="style10"><asp:Label ID="Namjke" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Payee Account No: " ForeColor="Black"></asp:Label></td>

    <td class="style6">
        <asp:TextBox ID="PayeeAccountNo" runat="server" 
            style="margin-right:79px"></asp:TextBox></td></tr>

   <tr><td class="style10"><asp:Label ID="Namhke" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Payee Name: " ForeColor="Black"></asp:Label></td>

    <td class="style6">
        <asp:TextBox ID="PayeeName" runat="server"
                    style="margin-right:79px"></asp:TextBox></td></tr>

   <tr><td class="style10"><asp:Label ID="paybrName" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Payee Branch Name: " ForeColor="Black"></asp:Label></td>

   <td class="style6">
        <asp:TextBox ID="PayeeBranchName" runat="server" 
            
            style="margin-right:79px"></asp:TextBox></td></tr>

    <tr><td></td><td><asp:ImageButton ID="AddBtn" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/new-add.png" style="margin-left: 10px" 
                Width="100px" onclick="AddBtn_Click" /></asp:Button></td></tr>

    <tr>
     <td><asp:ImageButton ID="Back" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/Backbtn.jpg" style="margin-left: 10px" 
                Width="100px" onclick="BackButton_Click" /></td>
      <td></td></tr>
      
    </table>
     </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>
   <%-- </div>
    </form>
</body>
</html>--%>
