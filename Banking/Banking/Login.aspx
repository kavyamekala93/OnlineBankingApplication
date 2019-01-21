<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Banking.Login" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .style14
    {
        font-size: xx-large;
    }
    .style15
    {
        height: 71px;
    }
    </style>
<%--</asp:Content>--%>


    <%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>
    <title></title>
    <style type="text/css">
        .style5
        {
            width: 146px;
            text-align: center;
            height: 50px;
        }
        .style6
        {
            width: 283px;
        }
        .style7
        {
            width: 380px;
            height: 50px;
        }
        .style8
        {
            width:380px;
            height: 50px;
           
        }
        .style19
        {
            color: #FFFFFF;
            width: 348px;
            height: 50px;
        }
        .style20
        {
            font-family: "Comic Sans MS";
            font-size: xx-large;
            width: 348px;
        }
        .style21
        {
            width: 348px;
            height: 50px;
            margin-left: 80px;
        }
        </style>
<%--</head>--%>
<%--<body>--%>
   <%-- <form id="form1" runat="server">--%>
    
    <p style="margin-left: 440px">
    <table>
    <td colspan=2 class="style5"><h1>BANKING LOGIN</h1></td>
    <tr><td class="style6"></td></tr>
    
     <%--<tr><td><asp:Label ID="Loginas" runat="server" Text="Login as:"></asp:Label></td> <td><asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" Width="95px">
        <asp:ListItem>User</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
    </asp:RadioButtonList> </td></tr> --%>
    <tr>
    <td class="style8" > <asp:Label runat="server" Text="Username: "
            style="margin-left:80px"></asp:Label></td>
    <td class="style19"><asp:TextBox ID="UserName" runat="server" 
            ontextchanged="LogIN_Click" style="margin-left: 0px"></asp:TextBox></td></tr>
        </p>
   
    <br />
    <br />
    <br />
    <br />
   <tr>
   <td class="style8">
    <asp:Label runat="server" Text="Password: "
            style="margin-left:80px"></asp:Label></td>
   <td class="style19">
   <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
   </td>
   </tr> 
    <br />
    <br />
    <tr><td class="style6"></td></tr>
   

    <tr><td class="style7"></td>
    <td class="style7" colspan="2">

            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/Untitled.png" Width="324px" onclick="ImageButton1_Click" />

        </td></tr>
    
    
    <%--<td class="style8">
        <asp:Button ID="LOGIN" runat="server" 
            onclick="LogIN_Click" Text="LOGIN" Width="120px" /></td></tr>--%>
    <tr>
    <td class="style8">
    <asp:Label ID="Label2" runat="server"></asp:Label></td> </tr>
       <tr>
    <td class="style7">
            <asp:ImageButton ID="ImageButton2" runat="server" style="margin-left:80px"
                ImageUrl="~/Images/ForgotPwd.jpg" Width="150px" onclick="ImageButton2_Click" />
            
                 
    </td>
    </tr>
    <tr>
     <td class="style8">
            <asp:Label ID="Label3" runat="server" Text="Security Question" style="margin-left:80px" Visible="False"></asp:Label>
        </td>
        <td class="style20">
            <asp:TextBox ID="Securityquestion" runat="server"  Visible="False" Width="299px"></asp:TextBox>
        </td>
    
    </tr>
       
       <tr>
    <td class="style7">
        <asp:Label ID="Label4" runat="server" Text="Answer"  style="margin-left:80px" Visible="False"></asp:Label>
    </td>
      <td class="style21">
            <asp:TextBox ID="txtanswer" runat="server" Visible="False"></asp:TextBox>
        </td>
        <td>

        <asp:ImageButton ID="ImageButton3" runat="server" 
                ImageUrl="~/Images/orange-submission-button.png" Width="150px" onclick="ImageButton3_Click" Visible="False" />
        
        </td>
        <td>
            <asp:Label ID="Error" runat="server" Text="Sorry!!! You are still Logged Out!!" 
                Visible="False"></asp:Label>
            </td>
    </tr>
    <tr>
    <td class="style7">
        <asp:Label ID="Label5" runat="server" Text="New Password:"  style="margin-left:80px" Visible="False"></asp:Label>
    </td>
         <td class="style19">
   <asp:TextBox ID="Password1" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
   </td>
    </tr>

    <tr>
    <td class="style7">
        <asp:Label ID="Label6" runat="server" Text="Confirm Password:"  style="margin-left:80px" Visible="False"></asp:Label>
    </td>
    <td class="style19">
   <asp:TextBox ID="Password2" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
   </td>
   <td>

        <asp:ImageButton ID="ImageButton4" runat="server" 
                ImageUrl="~/Images/orange-submission-button.png" Width="150px" onclick="ImageButton4_Click" Visible="False" />
        
        </td>
        <td>
            <asp:Label ID="Error2" runat="server" Text="Passwords dont match!!!" 
                Visible="False"></asp:Label>
            </td>
    </tr>
    <br />
    <br />
    <br />
    </table>
    
  <%--  </form>--%>
<%--</body>
</html>--%>
</asp:Content>
