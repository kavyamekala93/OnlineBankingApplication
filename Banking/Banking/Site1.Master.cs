using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banking
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                if (Session["Login"].ToString() == "Yes")
                {
                    ImageButton2.ImageUrl = "~/Images/logout.jpg";
                }

                else
                {
                    ImageButton2.ImageUrl = "~/Images/login.jpg";
                }
            }
            else
            {
                ImageButton2.ImageUrl = "~/Images/login.jpg";
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void Menu1_MenuItemClick1(object sender, MenuEventArgs e)
        {

        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Page.Header.DataBind();

        }
    }
}