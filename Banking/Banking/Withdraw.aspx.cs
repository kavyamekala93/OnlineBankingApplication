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
    public partial class Withdraw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
                string queryStringID = Request.QueryString["id"];
                AccountNo.Text = queryStringID;

                float ReturnCode;
                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("dbo.FetchBalance", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    SqlParameter Paramaccountno = new SqlParameter("@AccountNO", queryStringID);
                    cmd.Parameters.Add(Paramaccountno);
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();


                    while (reader.Read())
                    {
                        ReturnCode = Convert.ToSingle(reader[0]);
                        Balance.Text = Convert.ToString(ReturnCode);
                        Session["Lud"] = reader[1].ToString();
                    }



                }

            }


        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            string rannumber = r.Next(1, 100000).ToString();

            if (Session["lud"] != null)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("dbo.spUpdateBalance", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                    SqlParameter Paramaccountno = new SqlParameter("@AccountNO", AccountNo.Text);
                    SqlParameter Paramamount = new SqlParameter("@Amount", Amount.Text);
                    SqlParameter Paramtype = new SqlParameter("@Type", "WITHDRAW");

                   
                    SqlParameter Paramlud = new SqlParameter("@Lud",  (Session["lud"]).ToString ());

                    SqlParameter Paramlud1 = new SqlParameter("@Rannumber", rannumber);

                    cmd.Parameters.Add(Paramaccountno);
                    cmd.Parameters.Add(Paramamount);
                    cmd.Parameters.Add(Paramtype);
                    cmd.Parameters.Add(Paramlud);
                    cmd.Parameters.Add(Paramlud1);
                    con.Open();

                    int n = (int)(cmd.ExecuteNonQuery());

                    if (n == -1)
                    {
                        Message.Visible = true;
                        return;
                    }


                    cmd = new SqlCommand("dbo.FetchBalance", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                    SqlParameter ParamAccountno = new SqlParameter("@AccountNO", AccountNo.Text);
                    cmd.Parameters.Add(ParamAccountno);
                    float s = 0;
                    float b = Convert.ToSingle(cmd.ExecuteScalar());

                    cmd = new SqlCommand("dbo.spInsertStatement", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");


                    SqlParameter Paramdepositamount = new SqlParameter("@DepositAmount", s);
                    SqlParameter ParamAccountNO = new SqlParameter("@AccountNO", AccountNo.Text);
                    SqlParameter Paramadate = new SqlParameter("@DateAndTime", DateTime.Now);
                    SqlParameter Paramdescription = new SqlParameter("@Description", "Self Withdraw");
                    SqlParameter Parambalance = new SqlParameter("@Balance", b);
                    SqlParameter Paramwithdrawamount = new SqlParameter("@WithdrawalAmount", Amount.Text);

                    cmd.Parameters.Add(ParamAccountNO);
                    cmd.Parameters.Add(Paramdepositamount);
                    cmd.Parameters.Add(Paramwithdrawamount);
                    cmd.Parameters.Add(Paramadate);
                    cmd.Parameters.Add(Paramdescription);
                    cmd.Parameters.Add(Parambalance);
                    cmd.Connection = con;
                    int x = (int)cmd.ExecuteNonQuery();
                    Balance.Text = b.ToString();


                    //SqlCommand cmdCheck = new SqlCommand();
                    //cmdCheck.CommandText = "Select UserID from Account where AccountNO=" + AccountNo.Text;
                    //cmdCheck.Connection = con;
                    //string UserID = Convert.ToString(cmdCheck.ExecuteScalar());
                    //Response.Redirect("~/Welcome.aspx?id=" + UserID);
                }


            }
        }

       
        protected void Back_Click(object sender, EventArgs e)
        {
            string queryStringID = Request.QueryString["id"];
            AccountNo.Text = queryStringID;

            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmdCheck = new SqlCommand("dbo.SelectUserID", con);
                cmdCheck.CommandType = CommandType.StoredProcedure;
                SqlParameter Paramaccountno1 = new SqlParameter("@AccountNO", queryStringID);
                cmdCheck.Parameters.Add(Paramaccountno1);
                con.Open();
                //cmdCheck.CommandText = "Select UserID from Account where AccountNO=" + AccountNo.Text;
                //cmdCheck.Connection = con;
                string UserID = Convert.ToString(cmdCheck.ExecuteScalar());
                Response.Redirect("~/Home.aspx?id=" + UserID);

            }
        }
    }
}