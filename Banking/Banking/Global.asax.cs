using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Banking
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["flag1"] = 0;
            Application["flag2"] = 0;
            //DateTime d=DateTime.Now;
            //    DateTime d1 = new DateTime(2014, 10, 16, 0, 0, 0);
            //DateTime d2 = new DateTime(2014, 12, 31, 0, 0, 0);
            //    if( (d.Year == d1.Year && d.Month == d1.Month && d.Day == d1.Day && ((int)Application ["flag1"])==0)
            //        &&(d.Year == d2.Year && d.Month == d2.Month && d.Day == d2.Day && ((int)Application ["flag2"])==0))
            //Application ["count"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Session["Name"] = "";
            Session["count"] = 0;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}