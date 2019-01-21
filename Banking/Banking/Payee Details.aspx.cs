using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Banking
{
    public partial class Payee_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
            string queryStringID = Request.QueryString["id"];
            PayerAccountNo.Text = queryStringID;
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if ((PayeeAccountNo.Text != "") && (PayeeBranchName.Text != "") && (PayeeName.Text != ""))
            {
                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("dbo.spInsertPayee_Detail", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    SqlParameter Paramaccountno = new SqlParameter("@PayerAccountNO", PayerAccountNo.Text);
                    SqlParameter Parampaccountno = new SqlParameter("@PayeeAccountNO", PayeeAccountNo.Text);
                    SqlParameter Parampayeename = new SqlParameter("@PayeeName", PayeeName.Text);
                    SqlParameter ParamPayeeBranch = new SqlParameter("@PayeeBranch", PayeeBranchName.Text);


                    cmd.Parameters.Add(Paramaccountno);
                    cmd.Parameters.Add(Parampaccountno);
                    cmd.Parameters.Add(Parampayeename);
                    cmd.Parameters.Add(ParamPayeeBranch);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                Response.Write("PayeeAdded!!!");
                Response.Redirect("TransferMoney.aspx?id=" + PayerAccountNo.Text);
            }
            else
                Response.Write("Enter all the details!!!");
        }

        

        protected void MyAccountNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TransferMoney.aspx?id=" + PayerAccountNo.Text);
        }
    }
}