﻿using System;
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
    public partial class ChkBal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO BLUE BANK";
            string queryStringID = Request.QueryString["id"];
            AccountNo.Text = queryStringID;


            //string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    SqlCommand cmd = new SqlCommand("dbo.FetchBalance", con);
            //    cmd.CommandType = CommandType.StoredProcedure;

            //    // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

            //    SqlParameter Paramaccountno = new SqlParameter("@AccountNO", queryStringID);
            //    cmd.Parameters.Add(Paramaccountno);
            //    con.Open();
            //    //ReturnCode = Convert.ToSingle(cmd.ExecuteScalar());
            //    //Balance.Text = Convert.ToString(ReturnCode);
            //    Balance.Text = Convert.ToString(cmd.ExecuteScalar());
            //    con.Close();
            //}

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            
           
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            LblName.Text = "WELCOME " + Convert.ToString(Session["Name"]) + " TO THE BANK OF IBM";
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

        protected void Balance_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Check_Click(object sender, ImageClickEventArgs e)
        {
            string queryStringID = Request.QueryString["id"];
            AccountNo.Text = queryStringID;

            //float ReturnCode;
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.FetchBalance", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramaccountno = new SqlParameter("@AccountNO", queryStringID);
                cmd.Parameters.Add(Paramaccountno);
                con.Open();
                //ReturnCode = Convert.ToSingle(cmd.ExecuteScalar());
                //Balance.Text = Convert.ToString(ReturnCode);
                Balance.Text = Convert.ToString(cmd.ExecuteScalar());

            }
        }
    }
}