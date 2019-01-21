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
    public class Branch
    {
        string _BranchName;
        string _BranchContactNo;
        string _ManagerName;
        string _ManagerContactNo;

        public string BranchName
        {
            get
            {
                return _BranchName;
            }
            set
            {
                _BranchName = value;
            }
        }

        public string BranchContactNo
        {
            get
            {
                return _BranchContactNo;
            }
            set
            {
                _BranchContactNo = value;
            }
        }

        public string ManagerName
        {
            get
            {
                return _ManagerName;
            }
            set
            {
                _ManagerName = value;
            }
        }

        public string ManagerContactNo
        {
            get
            {
                return _ManagerContactNo;
            }
            set
            {
                _ManagerContactNo = value;
            }
        }

        public DataSet GetBranchName()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(CS);



            SqlDataAdapter da = new SqlDataAdapter("ListBranchName", con);

            da.SelectCommand.CommandType = CommandType.StoredProcedure;


            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;

        }

        //public string GetBranchDetails(string BranchName)
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand cmd = new SqlCommand("FillBranchDetails", con);
        //        cmd.CommandType = CommandType.StoredProcedure;


        //        SqlParameter branchname = new SqlParameter("@BranchName", BranchName);
        //        cmd.Parameters.Add(branchname);
        //        con.Open();
        //        return cmd.ExecuteScalar().ToString();
        //    }
        //}

        public string GetBranchContact(string BranchName)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("FillBranchContact", con);
                cmd.CommandType = CommandType.StoredProcedure;


                SqlParameter branchname = new SqlParameter("@BranchName", BranchName);
                cmd.Parameters.Add(branchname);
                con.Open();
                return cmd.ExecuteScalar().ToString();
            }
        }
        public string GetManagerName(string BranchName)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("FillManagerName", con);
                cmd.CommandType = CommandType.StoredProcedure;


                SqlParameter branchname = new SqlParameter("@BranchName", BranchName);
                cmd.Parameters.Add(branchname);
                con.Open();
                return cmd.ExecuteScalar().ToString();
            }
        }
        public string GetManagerContact(string BranchName)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("FillManagerContact", con);
                cmd.CommandType = CommandType.StoredProcedure;


                SqlParameter branchname = new SqlParameter("@BranchName", BranchName);
                cmd.Parameters.Add(branchname);
                con.Open();
                return cmd.ExecuteScalar().ToString();
            }
        }
    }
}