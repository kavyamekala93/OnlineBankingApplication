using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Data;

namespace Banking
{
    public partial class Register2 : System.Web.UI.Page
    {
        Branch BranchNm = new Branch();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
               //filling BranchName
                DataSet ds = new DataSet();

                ds = BranchNm.GetBranchName();
                ddlBranchName.DataTextField = ds.Tables[0].Columns["BranchName"].ToString();
                ddlBranchName.DataValueField = ds.Tables[0].Columns["BranchName"].ToString();

                ddlBranchName.DataSource = ds.Tables[0];
                ddlBranchName.DataBind();
                
            }
        }

        protected void ddlBranchName_SelectedIndexChanged(object sender, EventArgs e)
        {
            BranchNm.BranchName = ddlBranchName.SelectedValue;

            //BranchContact.Text = BranchNm.GetBranchDetails(BranchNm.BranchName);
            //ManagerName.Text = BranchNm.GetBranchDetails(BranchNm.BranchName);
            //ManagerContact.Text = BranchNm.GetBranchDetails(BranchNm.BranchName);

            BranchContact.Text = BranchNm.GetBranchContact(BranchNm.BranchName);
            ManagerName.Text = BranchNm.GetManagerName(BranchNm.BranchName);
            ManagerContact.Text = BranchNm.GetManagerContact(BranchNm.BranchName);
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("dbo.InsertAccountDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;


                string accno = AccountNo.Text.ToString();
                string openingamt = OpeningAmount.Text.ToString();
               // string openingdt = txtDate.Text;
                string openingdt = datepicker.Value.ToString();
                string branchName = ddlBranchName.Text.ToString();
                string uid = Request.QueryString["uid"];
               // double bal = Convert.ToDouble(OpeningAmount.Text);
                //string bal = OpeningAmount.Text.ToString();

                Random r = new Random();
                string rannumber =  r.Next(1, 100000).ToString();
                

                SqlParameter Paramaccno = new SqlParameter("@AccountNO", accno);
                SqlParameter Paramuid = new SqlParameter("@UserID", uid);
                SqlParameter Paramopeningamt = new SqlParameter("@OpeningAmount", openingamt);
                SqlParameter Paramopeningdt = new SqlParameter("@OpeningDate", openingdt);
               // SqlParameter Paramopeningdt = new SqlParameter("@OpeningDate", Convert.ToDateTime(openingdt).ToShortDateString());
                SqlParameter ParambranchName = new SqlParameter("@BranchName", branchName);
                SqlParameter Parambal = new SqlParameter("@Balance", openingamt);
                SqlParameter Paramran = new SqlParameter("@Rnumber", rannumber);


                cmd.Parameters.Add(Paramaccno);
                cmd.Parameters.Add(Paramuid);
                cmd.Parameters.Add(Paramopeningamt);
                cmd.Parameters.Add(Paramopeningdt);
                cmd.Parameters.Add(ParambranchName);
                cmd.Parameters.Add(Parambal);
                cmd.Parameters.Add(Paramran);
              

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("~/Login.aspx");
            }
        }

       
    }
}