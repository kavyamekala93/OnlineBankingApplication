<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Statement.aspx.cs" Inherits="Banking.Statement" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />--%>

<%--<head id="Head1" runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">--%>
<%--// <![CDATA[

        function datepicker_onclick() {

        }

        function datepicker1_onclick() {

        }

       

// ]]>--%>
   <%-- </script>
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
<script src="JScript2.js" type="text/javascript"></script>
<script src="JScript7.js" type="text/javascript"></script>


<style type="text/css">
        .style1
        {
            width: 740px;
            height: 364px;
        }
        .style2
        {
            width: 600px;
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
        .style3
        {
            width: 760px;
        }
    </style>

    <table class="style1">
     <tr><td><h1 class="style2"><asp:Label ID="LblName" runat="server" style="text-align: center; margin-left: 10px; ForeColor=Black" 
        Text="Label" ForeColor="Black"></asp:Label></h1></td></tr>
   <tr><td><h2 class="style2"><asp:Label ID="LblNames" runat="server" style="text-align: center; margin-left: 200px; ForeColor=Black" 
        Text="TRANSACTIONS" ForeColor="Black"></asp:Label></h2></td></tr>
    
    <tr><td class="style10"><asp:Label ID="Name" runat="server" style="text-align: center; margin-left:60px; ForeColor=Black" 
        Text="Account No: " ForeColor="Black"></asp:Label>
        
        <asp:TextBox ID="AccountNo" runat="server" 
            ReadOnly="True"
            style="margin-left:180px"></asp:TextBox></td>

        </tr>
        
        <tr><td></td></tr>
        <tr>
        <td class="style10">
            <asp:RadioButton ID="RadioButton1" runat="server" Text="All Transactions" 
                AutoPostBack="True" GroupName="trans" 
                style="margin-left:79px"
                oncheckedchanged="RadioButton1_CheckedChanged" />
        
        </td>
        </tr>
       <tr> 
       <td class="style10">
        <asp:RadioButton ID="RadioButton2" runat="server" Text="Last 10 transactions" 
               AutoPostBack="True" GroupName="trans" 
               style="margin-left:79px"
               oncheckedchanged="RadioButton2_CheckedChanged" />
        </td>
        </tr>
        <tr>
        <td class="style10">
        <asp:RadioButton ID="RadioButton3" runat="server" Text="Between dates" 
                AutoPostBack="True" GroupName="trans"
             style="margin-left:79px"
                oncheckedchanged="RadioButton3_CheckedChanged" />
        </td>
        
        </tr>
        <tr>
        <td class="style10"> <asp:Label ID="Label1" runat="server" Text="Start Date: "
         style="margin-left:120px"
                Visible="False"></asp:Label>
        
        <input type="text" id="datepicker"  runat ="server" class ="DatePicker" 
                onclick="return datepicker_onclick()" visible="False" 
                style="margin-left:150px" 
                causesvalidation="True" />
        </td>
        </tr>

        <tr>
        <td class="style10"><asp:Label ID="Label2" runat="server" Text="End Date: "
        style="margin-left:120px" 
                Visible="False"></asp:Label>
        
        <input type="text" id="datepicker1"  runat ="server" class ="DatePicker" 
                onclick="return datepicker1_onclick()" visible="False" 
                style="margin-left:160px" 
                causesvalidation="True"  />
        </td>
        </tr>
        <tr><td class="style10"><asp:Button ID="Showbtn" runat="server" Text="Show" style="margin-left:120px" onclick="Showbtn_Click" 
        
                       Visible="False"></asp:Button></td></tr> 
                       <tr><td></td></tr>

        <tr><td class="style3"><asp:GridView ID="GridView1" runat="server" CellPadding="2" 
                ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <EmptyDataTemplate>
                No Data Found
            </EmptyDataTemplate>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView></td></tr>
            <tr><td></td></tr>
            
            <tr><td>
               <asp:ImageButton ID="Back" runat="server" Height="50px" Value="Next"
                ImageUrl="~/Images/Backbtn.jpg" style="margin-left: 10px" 
                Width="100px" onclick="BackButton_Click" />
               </td>
               </tr> 

    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>

    <%--</form>
</body>
</html>--%>