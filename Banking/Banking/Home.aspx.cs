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
    public partial class Home : System.Web.UI.Page
    {
        DateTime d = DateTime.Now;
        DateTime d1 = new DateTime(2014, 11, 12, 0, 0, 0);
        DateTime d2 = new DateTime(2015, 4, 23, 0, 0, 0);

        protected void Page_Load(object sender, EventArgs e)
        {
            LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
            string queryStringID = Request.QueryString["id"];
            if (queryStringID == "Admin")
            {
                Register.Visible = true;
                if ((d.Year == d1.Year && d.Month == d1.Month && d.Day == d1.Day && ((int)Application["flag1"]) == 0)
                    || (d.Year == d2.Year && d.Month == d2.Month && d.Day == d2.Day && ((int)Application["flag2"]) == 0))
                Interest.Visible = true;
                Sum.Visible = true;
                
            }

                string ReturnCode;
                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("dbo.SelectAccountNo", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    SqlParameter Paramusername = new SqlParameter("@UserID", queryStringID);



                    cmd.Parameters.Add(Paramusername);


                    con.Open();
                    ReturnCode = (string)cmd.ExecuteScalar();
                }
                AccountNo.Text = ReturnCode;
            
        }

       

      

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.spCalculateInterest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                int n = cmd.ExecuteNonQuery();
            }
            //Label1.Visible = true;
             
        }

        protected void LogoutButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void AccountNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Interest_Click1(object sender, ImageClickEventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.spCalculateInterest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                int n = cmd.ExecuteNonQuery();
            }
            Interest.Visible = false;
            if ((d.Year == d1.Year && d.Month == d1.Month && d.Day == d1.Day && ((int)Application["flag1"]) == 0))
                Application["flag1"] = 1;
            if (d.Year == d2.Year && d.Month == d2.Month && d.Day == d2.Day && ((int)Application["flag2"]) == 0)
                Application["flag2"] = 1;
            Interestmessage.Visible = true;
        }

        protected void ChkBal_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ChkBal.aspx?id=" + AccountNo.Text);
        }

        protected void Deposit_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Deposit.aspx?id=" + AccountNo.Text);
        }

        protected void Withdraw_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Withdraw.aspx?id=" + AccountNo.Text);
        }

        protected void Transfer_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TransferMoney.aspx?id=" + AccountNo.Text);
        }

        protected void Statement_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Statement.aspx?id=" + AccountNo.Text);
        }

        protected void Register_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Register1.aspx");
        }

        protected void Sum_Click(object sender, ImageClickEventArgs e)
        {
            Sum1.Visible = true;
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.BranchBalance", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Sum1.Text = Convert.ToString(cmd.ExecuteScalar());
            }
        }

       
    }
}