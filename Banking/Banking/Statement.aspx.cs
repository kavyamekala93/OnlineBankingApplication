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
    public partial class Statement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
            string queryStringID = Request.QueryString["id"];
            AccountNo.Text = queryStringID;

            //string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    SqlCommand cmd = new SqlCommand("SelectStatement", con);
            //    cmd.CommandType = CommandType.StoredProcedure;

            //    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

            //    SqlParameter Paramusername = new SqlParameter("@AccountNO", AccountNo.Text);



            //    cmd.Parameters.Add(Paramusername);


            //    con.Open();
            //    SqlDataReader Reader = cmd.ExecuteReader();

            //    GridView1.DataSource = Reader;
            //    GridView1.DataBind();
            //}
        }

        protected void BackButton_Click(object sender, EventArgs e)
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

        protected void Showbtn_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spSelectStatementByDate", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramaccountno = new SqlParameter("@AccountNO", AccountNo.Text);
                cmd.Parameters.Add(Paramaccountno);
                cmd.Parameters.Add("@Date1", datepicker.Value.ToString());
                cmd.Parameters.Add("@Date2", datepicker1.Value.ToString());
                con.Open();
                SqlDataReader Reader = cmd.ExecuteReader();
                GridView1.DataSource = Reader;
                GridView1.DataBind();
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            datepicker.Visible = false;
            datepicker1.Visible = false;
            Showbtn.Visible = false;
            
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spSelectAllStatement", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramaccountno = new SqlParameter("@AccountNO", AccountNo.Text);
                cmd.Parameters.Add(Paramaccountno);
                con.Open();
                SqlDataReader Reader = cmd.ExecuteReader();
                GridView1.DataSource = Reader;
                GridView1.DataBind();
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            datepicker.Visible = false;
            datepicker1.Visible = false;
            Showbtn.Visible = false;

            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spSelectLastTen", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramaccountno = new SqlParameter("@AccountNO", AccountNo.Text);
                cmd.Parameters.Add(Paramaccountno);
                con.Open();
                SqlDataReader Reader = cmd.ExecuteReader();
                GridView1.DataSource = Reader;
                GridView1.DataBind();
            }
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            datepicker.Visible = true;
            datepicker1.Visible = true;
            Showbtn.Visible = true;
        }

        protected void AccountNo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}