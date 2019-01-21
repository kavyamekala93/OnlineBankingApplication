<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="Banking.Register1" %>

<script runat="server">

    protected void Securityquestion_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>
<%--
<link href="Master.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%#ResolveUrl("~/") %>http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />--%>
   
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <%--  <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>

  <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server">
        
        <ContentTemplate>

     <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="JScript1.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 740px;
            height: 394px;
        }
        .style3
        {
            width: 400px;
        }
        .style7
        {
            width: 302px;
            text-align: center;
            font-size: large;
        }
        .style8
        {
           
            width: 370px;
            height: 50px;
        }
        .style9
        {
            height: 50px;
            width: 370px;
        }
        .style10
        {
            text-align: center;
        }
        .style11
        {
            width: 77px;
        }
    </style>
    
   
<%--</asp:Content>--%>



<table class="style1">
    <tr>
        <td colspan=2 class="style7">
            <h1>
                &nbsp;<strong style="text-align: center">Registration</strong></h1>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style11">
            &nbsp;</td>

    </tr>
    <tr>
        <td class="style8">
            <asp:Label runat="server" Text="Name: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="Name" runat="server" ontextchanged="Name_TextChanged"
            style=" margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label runat="server" Text="UserID:  "
            style="margin-left:80px"></asp:Label> </td>
        <td class="style9">
            <asp:TextBox ID="UserID" runat="server" ontextchanged="UserID_TextChanged"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label runat="server" Text="Password: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="Pwd" runat="server" TextMode="Password"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Confirm Password: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="ConfrmPwd" runat="server" TextMode="Password"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="EmailID: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="EmailID" runat="server"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Phone No.: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="PhoneNo" runat="server"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Address: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="Address" runat="server"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Occupation: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="Occupation" runat="server"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Yearly Income: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="YearlyIncome" runat="server"
            style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Gender: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:DropDownList ID="Gender" runat="server"
             style="margin-left:80px">
                <asp:ListItem Selected="True">--Select--</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
               
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style8">
             <asp:Label runat="server" Text="Age: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:TextBox ID="Age" runat="server"
             style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td class="style8">
            <asp:Label runat="server" Text="Security Question: "
            style="margin-left:80px"></asp:Label></td>
        <td class="style9">
            <asp:DropDownList ID="Securityquestion" runat="server" 
                onselectedindexchanged="Securityquestion_SelectedIndexChanged"
                 style="margin-left:80px" AutoPostBack="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
    <td class="style3">
        <asp:Label runat="server" Text="Answer: "
            style="margin-left:80px"></asp:Label>
    </td>
      <td class="style9">
            <asp:TextBox ID="txtanswer" runat="server"
             style="margin-left:80px"></asp:TextBox>
        </td>
    </tr>

  <tr>
        <td class="style8">
            </td></tr>

    <tr>
        <td class="style8">
            </td>
        <td>
            <asp:ImageButton ID="Next" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/NextButton.gif" style="margin-left: 10px" 
                Width="239px" onclick="Next_Click" />
        </td>
    </tr>
</table>
 </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

