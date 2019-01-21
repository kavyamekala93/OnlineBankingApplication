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
    public partial class Login : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        protected void LogIN_Click(object sender, EventArgs e)
        {

            ////If you DB to store username and Password

            //try
            //{
            //    if (RadioButtonList1.SelectedItem.Text == "Admin")
            //    {
            //    if (AuthenticateAdmin(UserName.Text, Password.Text))
            //    {


            //            Response.Redirect("~/WebForm2.aspx");
            //        }

            //        else
            //        {
            //            Label2.Text = "Invalid User Name and/or Password";
            //        }

            //    }
            ////}
            ////catch (Exception)
            ////{
            ////    Label2.Text = "Invalid User Name and/or Password";
            ////}

            ////try
            ////{
            //if (RadioButtonList1.SelectedItem.Text == "User")
            //{
            //if (AuthenticateUser(UserName.Text, Password.Text))
            //{
            //    Session["Login"] = "Yes";
            //    //     Response.Redirect("~/WebForm3.aspx");
            //        FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);                            use this
            //        Response.Redirect("Home.aspx?id="+UserName.Text);

            //    }


            //    else
            //    {
            //        Label2.Text = "Invalid User Name and/or Password";
            //    }
            //}
            //    }
            //    catch (Exception)
            //    {
            //        Label2.Text = "Invalid User Name and/or Password";
            //    }
        }


















        ////if you use config file to store username and password

        ////if (FormsAuthentication.Authenticate(UserName.Text, Password.Text))
        ////{
        ////    FormsAuthentication.RedirectFromLoginPage(UserName.Text, RemPwd.Checked);
        ////}
        ////else
        ////{
        // //   Lblinvalid.Text = "Invalid User Name and/or Password";
        ////    .Text = "Invalid User Name and/or Password";
        ////}



        private bool AuthenticateUser(string username, string password)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.Login_User", con);
                cmd.CommandType = CommandType.StoredProcedure;

                string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramusername = new SqlParameter("@UserID", username);
                SqlParameter Parampassword = new SqlParameter("@Pssword", enCryptedPassword);


                cmd.Parameters.Add(Paramusername);
                cmd.Parameters.Add(Parampassword);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();
                return ReturnCode == 1;


            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (AuthenticateUser(UserName.Text, Password.Text))
            {
                Session["Login"] = "Yes";
                //     Response.Redirect("~/WebForm3.aspx");
                FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);

                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                //TO DISPLAY NAME OF THE USER ON EVERY PAGE
                //STORED PROCEDURE TO FETCH NAME USING THE USERID ID CALLED
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("dbo.spSelectNameOfUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", UserName.Text);

                    con.Open();
                    Session["Name"] = Convert.ToString(cmd.ExecuteScalar());
                }
                Response.Redirect("Home.aspx?id=" + UserName.Text);
                //Response.Redirect("~/Home.aspx?id=");

            }


            else
            {
                Label2.Text = "Invalid User Name and/or Password";
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Security securty = new Security();

            Label3.Visible = true;
            Securityquestion.Visible = true;
            Label4.Visible = true;
            txtanswer.Visible = true;
            Securityquestion.Visible = true;

            ImageButton3.Visible = true;


            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.Fetchsecurityquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter Paramuserid = new SqlParameter("@userid", UserName.Text);
                cmd.Parameters.Add(Paramuserid);
                con.Open();

                Securityquestion.Text = Convert.ToString(cmd.ExecuteScalar());
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            if (AuthenticateAnswer(UserName.Text, txtanswer.Text))
            {

                Label5.Visible = true;
                Label6.Visible = true;
                Password1.Visible = true;
                Password2.Visible = true;
                ImageButton4.Visible = true;


            }
            else
            {
                Error.Visible = true;
            }
        }

        private bool AuthenticateAnswer(string UserName, string txtanswer)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spcheckanswer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //string enCryptedanswer = FormsAuthentication.HashPasswordForStoringInConfigFile(txtanswer, "SHA1");


                SqlParameter Paramanswer = new SqlParameter("@Answer", txtanswer);
                SqlParameter Paramuserid = new SqlParameter("@userid", UserName);


                cmd.Parameters.Add(Paramuserid);
                cmd.Parameters.Add(Paramanswer);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();

                return ReturnCode == 1;

            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (Password1.Text == Password2.Text)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("UpdatePassword", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    string password = Password1.Text.ToString();
                    string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");


                    SqlParameter Parampsswrd = new SqlParameter("@Newpasswrd", enCryptedPassword);
                    SqlParameter Paramuserid = new SqlParameter("@UserID", UserName.Text.ToString());


                    cmd.Parameters.Add(Paramuserid);
                    cmd.Parameters.Add(Parampsswrd);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    //int ReturnCode = (int)cmd.ExecuteScalar();
                    Response.Redirect("~/Login.aspx");
                }
            }
            else
            {
                Error2.Visible = true;
            }
        }

        //private bool AuthenticateAdmin(string username, string password)
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand cmd = new SqlCommand("dbo.Login_Admin", con);
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        // string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

        //        SqlParameter Paramusername = new SqlParameter("@UserID", username);
        //        SqlParameter Parampassword = new SqlParameter("@Pssword", password);


        //        cmd.Parameters.Add(Paramusername);
        //        cmd.Parameters.Add(Parampassword);

        //        con.Open();
        //        int ReturnCode = (int)cmd.ExecuteScalar();
        //        return ReturnCode == 1;


        //    }
        //}





        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}
    
    
    
