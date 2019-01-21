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
    public partial class TransferMoney : System.Web.UI.Page
    {
        allconnection a = new allconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
                string queryStringID = Request.QueryString["id"];
                MyAccountNo.Text = queryStringID;
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

                //filling BranchName
                SqlDataReader dr = a.GetRcvrName(MyAccountNo.Text);

                while (dr.Read())
                {
                    ddlRcvrName.Items.Add(dr.GetString(0));
                }





            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Amount.Text == "")
            {
                Response.Write("Specify the amount!!!!");
            }
            else
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

                        SqlParameter Paramaccountno = new SqlParameter("@AccountNO", MyAccountNo.Text);
                        SqlParameter Paramamount = new SqlParameter("@Amount", Amount.Text);
                        SqlParameter Paramtype = new SqlParameter("@Type", "WITHDRAW");
                        SqlParameter Paramlud = new SqlParameter("@Lud", (Session["lud"]).ToString());

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
                        

                       SqlCommand cmd1 = new SqlCommand("dbo.spPayeeBalance", con);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        SqlParameter Parammyaccountno = new SqlParameter("@AccountNO", MyAccountNo.Text);
                        SqlParameter Paramotheraccountno = new SqlParameter("@PayeeAccNo", OtherAccountNo.Text);
                        SqlParameter Paramrcvdamount = new SqlParameter("@Amount", Amount.Text);
                        //SqlParameter Paramtypee = new SqlParameter("@Type", "DEPOSIT");
                        //SqlParameter Paramlud2 = new SqlParameter("@Lud", (Session["lud"]).ToString());

                        //SqlParameter Paramlud3 = new SqlParameter("@Rannumber", rannumber);

                        cmd1.Parameters.Add(Parammyaccountno);
                        cmd1.Parameters.Add(Paramotheraccountno);
                        cmd1.Parameters.Add(Paramrcvdamount);
                        //cmd1.Parameters.Add(Paramtypee);
                        //cmd1.Parameters.Add(Paramlud2);
                        //cmd1.Parameters.Add(Paramlud3);

                        int p = (int)(cmd1.ExecuteNonQuery());

                        //To insert The transactions in Statement table of payee

                        float b1 = a.GetBalance(MyAccountNo.Text);
                        float b2 = a.GetBalance(OtherAccountNo.Text);

                        SqlCommand cmd2 = new SqlCommand("dbo.spInsertStatement", con);
                        cmd2.CommandType = CommandType.StoredProcedure;

                        // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                        float s = 0;
                        string PayeeName = Convert.ToString(ddlRcvrName.SelectedItem);
                        string argument = "Transferred to " + PayeeName;
                        SqlParameter Paramacctno = new SqlParameter("@AccountNO", MyAccountNo.Text);
                        SqlParameter Paramdepositamount = new SqlParameter("@DepositAmount", s);
                        SqlParameter Paramwithdrawamount = new SqlParameter("@WithdrawalAmount", Amount.Text);
                        SqlParameter Paramadate = new SqlParameter("@DateAndTime", DateTime.Now);
                        SqlParameter Paramdescription = new SqlParameter("@Description", argument);
                        SqlParameter Parambalance = new SqlParameter("@Balance", b1);

                        cmd2.Parameters.Add(Paramacctno);
                        cmd2.Parameters.Add(Paramdepositamount);
                        cmd2.Parameters.Add(Paramwithdrawamount);
                        cmd2.Parameters.Add(Paramadate);
                        cmd2.Parameters.Add(Paramdescription);
                        cmd2.Parameters.Add(Parambalance);
                        cmd2.Connection = con;
                        int x = (int)cmd2.ExecuteNonQuery();

                        //To insert The transactions in Statement table of receiver



                        SqlCommand cmd3 = new SqlCommand("dbo.spInsertStatement", con);
                        cmd3.CommandType = CommandType.StoredProcedure;

                        // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                        float f = 0;
                        string argument1 = "Received from " + Convert.ToString(Session["Name"]);
                        SqlParameter Paramactno = new SqlParameter("@AccountNO", OtherAccountNo.Text);
                        SqlParameter Paramdepositamt = new SqlParameter("@DepositAmount", Amount.Text);
                        SqlParameter Paramwithdrawamt = new SqlParameter("@WithdrawalAmount", f);
                        SqlParameter Paramadatetime = new SqlParameter("@DateAndTime", DateTime.Now);
                        SqlParameter Paramdescriptions = new SqlParameter("@Description", argument1);
                        SqlParameter Parambalances = new SqlParameter("@Balance", b2);

                        cmd3.Parameters.Add(Paramactno);
                        cmd3.Parameters.Add(Paramdepositamt);
                        cmd3.Parameters.Add(Paramwithdrawamt);
                        cmd3.Parameters.Add(Paramadatetime);
                        cmd3.Parameters.Add(Paramdescriptions);
                        cmd3.Parameters.Add(Parambalances);
                        cmd3.Connection = con;
                        int y = (int)cmd3.ExecuteNonQuery();
                        Balance.Text = b1.ToString();



                        //Redirecting to the HomePage
                        Response.Write("Money transferred!!!");
                        string queryStringID = Request.QueryString["id"];
                        MyAccountNo.Text = queryStringID;


                        using (SqlConnection com = new SqlConnection(CS))
                        {
                            SqlCommand cmdCheck = new SqlCommand("dbo.SelectUserID", com);
                            cmdCheck.CommandType = CommandType.StoredProcedure;
                            SqlParameter Paramaccountno1 = new SqlParameter("@AccountNO", queryStringID);
                            cmdCheck.Parameters.Add(Paramaccountno1);
                            com.Open();
                            //cmdCheck.CommandText = "Select UserID from Account where AccountNO=" + AccountNo.Text;
                            //cmdCheck.Connection = con;
                            string UserID = Convert.ToString(cmdCheck.ExecuteScalar());
                            Response.Redirect("~/Home.aspx?id=" + UserID);


                        }
                    }
                }
            }
        } 

        //protected void ddlBranchName_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand cmd = new SqlCommand("dbo.spFetchRcvrName", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

        //        SqlParameter Parambranch = new SqlParameter("@BranchName", ddlBranchName.SelectedValue);
        //        cmd.Parameters.Add(Parambranch);
        //        con.Open();
        //        SqlDataReader dr = null;
        //        dr = cmd.ExecuteReader();
        //        ddlRcvrName.Items.Clear();
        //        while (dr.Read())
        //        {
        //            ddlRcvrName.Items.Add(dr.GetString(0).ToString());
        //        }

        //    }


        //}

        protected void ddlRcvrName_SelectedIndexChanged(object sender, EventArgs e)
        {
            OtherAccountNo.Text = a.GetOtherAccountNo(ddlRcvrName.SelectedValue);
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            string queryStringID = Request.QueryString["id"];
            MyAccountNo.Text = queryStringID;

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

        protected void MyAccountNo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payee Details.aspx?id=" + MyAccountNo.Text);
        }



    }
}