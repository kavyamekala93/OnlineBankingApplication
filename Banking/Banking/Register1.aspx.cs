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
    public partial class Register1 : System.Web.UI.Page
    {
        Security securty = new Security();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //filling securityquestion
                DataSet ds = new DataSet();

                ds = securty.GetSecurity();
                Securityquestion.DataTextField = ds.Tables[0].Columns["Security_Question"].ToString();
                Securityquestion.DataValueField = ds.Tables[0].Columns["Security_Question"].ToString();

                Securityquestion.DataSource = ds.Tables[0];
                Securityquestion.DataBind();

            }
        }

        protected void TextBox12_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
           
        }

        protected void Name_TextChanged(object sender, EventArgs e)
        {

        }

        protected void UserID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Next_Click(object sender, ImageClickEventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.InsertUser_Details", con);
                cmd.CommandType = CommandType.StoredProcedure;


                string name = Name.Text.ToString();
                string userID = UserID.Text.ToString();
                string password = Pwd.Text.ToString();
                string enCryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
                string emailID = EmailID.Text.ToString();
                string phoneNo = PhoneNo.Text.ToString();
                string address = Address.Text.ToString();
                string age = Age.Text.ToString();
                string gender = Gender.Text.ToString();
                string occupation = Occupation.Text.ToString();
                string yearlyincome = YearlyIncome.Text.ToString();
                string securityquestion = Securityquestion.Text.ToString();
                string answer = txtanswer.Text.ToString();


                SqlParameter Paramname = new SqlParameter("@Name", name);
                SqlParameter Paramid = new SqlParameter("@UserID", userID);
                SqlParameter Parampassword = new SqlParameter("@Pssword", enCryptedPassword);
                SqlParameter Paramemail = new SqlParameter("@EmailID", emailID);
                SqlParameter Paramphone = new SqlParameter("@PhoneNO", phoneNo);
                SqlParameter Paramaddress = new SqlParameter("@Adress", address);
                SqlParameter Paramage = new SqlParameter("@Age", age);
                SqlParameter Paramgender = new SqlParameter("@Gender", gender);
                SqlParameter Paramoccupation = new SqlParameter("@Occupation", occupation);
                SqlParameter Paramyearlyincome = new SqlParameter("@YearlyIncome", yearlyincome);
                SqlParameter Paramsecurityquestion = new SqlParameter("@SecurityQuestion", securityquestion);
                SqlParameter Paramanswer = new SqlParameter("@Answer", answer);

                cmd.Parameters.Add(Paramname);
                cmd.Parameters.Add(Paramid);
                cmd.Parameters.Add(Parampassword);
                cmd.Parameters.Add(Paramemail);
                cmd.Parameters.Add(Paramphone);
                cmd.Parameters.Add(Paramaddress);
                cmd.Parameters.Add(Paramage);
                cmd.Parameters.Add(Paramgender);
                cmd.Parameters.Add(Paramoccupation);
                cmd.Parameters.Add(Paramyearlyincome);
                cmd.Parameters.Add(Paramsecurityquestion);
                cmd.Parameters.Add(Paramanswer);


                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("Register2.aspx?uid=" + UserID.Text);
            }
        }

        protected void Securityquestion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}