﻿<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="Banking.Deposit" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />--%>

<%--<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>--%>
   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
        
        <ContentTemplate>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="JScript6.js" type="text/javascript"></script>

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
        Text="DEPOSIT" ForeColor="Black"></asp:Label></h2></td></tr>

    <tr><td class="style10"><asp:Label ID="Name" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Account No: " ForeColor="Black"></asp:Label></td>

        <td class="style6">
        <asp:TextBox ID="AccountNo" runat="server" 
            ReadOnly="True"
            style="margin-right:79px"></asp:TextBox></td></tr>

    <tr><td class="style10"><asp:Label ID="Namedd" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Amount: " ForeColor="Black"></asp:Label></td>

    <td class="style6">
        <asp:TextBox ID="Amount" runat="server" 
            
            style="margin-right:79px"></asp:TextBox></td></tr>

  <tr><td class="style10"><asp:Label ID="LblNamee" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
        Text="Balance: " ForeColor="Black"></asp:Label></td>

    <td class="style6"><asp:TextBox ID="Balance" runat="server"  
    style="margin-right:79px"></asp:TextBox></td></tr>
    <tr><td></td>
      <td>  <asp:ImageButton ID="Submit" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/orange-submission-button.png" style="margin-left: 10px" 
                Width="150px" onclick="Submit_Click" /></td></tr>
      <tr>
      <td><asp:ImageButton ID="Back" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/Backbtn.jpg" style="margin-left: 10px" 
                Width="100px" onclick="Back_Click" /></asp:Button></td>
      <td></td></tr>
      <tr><td><h3> <class="style2">
          <asp:Label ID="Message" runat="server" style="text-align: center; margin-left: 79px; ForeColor=Black" 
         ForeColor="Black" Visible="False">Some Other user already changed the data!!</asp:Label> </h3></td></tr>



    </table>
     </ContentTemplate>
    </asp:UpdatePanel>
   <%-- </form>
</body>
</html>--%>
</asp:Content>