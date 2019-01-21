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
    public class Security
    {
        string _security;

        public string Secure
        {
            get
            {
                return _security;
            }
            set
            {
                _security = value;
            }
        }

        public DataSet GetSecurity()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(CS);



            SqlDataAdapter da = new SqlDataAdapter("ListSecurityQuestion", con);

            da.SelectCommand.CommandType = CommandType.StoredProcedure;


            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;

        }
    }
}