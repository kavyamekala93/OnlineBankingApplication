<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register2.aspx.cs" Inherits="Banking.Register2" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />--%>


<%--<a href="Branch.cs">Branch.cs</a>--%>
<%--<head runat="server">
    <title></title>--%>
   
<%--</head>
<body>--%>
    <%--<form id="form1" runat="server"--%>
   
   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
        
        <ContentTemplate>

    <style type="text/css">
        .style1
        {
            width: 740px;
            height: 364px;
        }
        .style2
        {
            width: 409px;
        }
        .style6
        {
            width: 370px;
            height: 50px;
        }
        .style8
        {
            width: 843px;
            text-align: center;
        }
        .style9
        {
            width: 383px;
        }
        .style10
        {
           
            width: 370px;
            height: 50px;
        }
    </style>

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   <script src="JScript2.js" type="text/javascript"></script>
<script src="JScript3.js" type="text/javascript"></script>
   
    <table class="style1">
        <tr>
            <td colspan=2 class="style2">
                <h1>
                <strong style="text-align: center; margin-left: 180px">
                    Account Details </strong></h1>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                 <asp:Label runat="server" Text="Account No:  "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:TextBox ID="AccountNo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                 <asp:Label runat="server" Text="Opening Amount:  "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:TextBox ID="OpeningAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label runat="server" Text="Opening Date: "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <input type="text" id="datepicker"  runat ="server" class ="DatePicker"/></td>
        </tr>
        <tr>
            <td class="style10">
                 <asp:Label runat="server" Text="Branch Name: "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:DropDownList ID="ddlBranchName" runat="server" 
                    onselectedindexchanged="ddlBranchName_SelectedIndexChanged" 
                    AutoPostBack="True" Height="22px" style="margin-left: 0px" Width="128px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label runat="server" Text="Branch Contact No: "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:TextBox ID="BranchContact" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label runat="server" Text="Manager Name: "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:TextBox ID="ManagerName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                 <asp:Label runat="server" Text="Manager Contact No: "
            style="margin-left:80px"></asp:Label></td>
            <td class="style6">
                <asp:TextBox ID="ManagerContact" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
            </td>
            <td>
             <asp:ImageButton ID="Register" runat="server" Height="50px" Value="Register"
                ImageUrl="~/Images/RegisterButton.jpg" style="margin-left: 10px" 
                Width="239px" onclick="Register_Click" />
            </td>
        </tr>
    </table>
     </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>
   <%-- </form>
</body>
</html>--%>
