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
    public class allconnection
    {
        string _MyAccountNo;
        //string _OtherAccountNo;
        string _BranchName;
        string _ReceiverName;
        //string _Amount;
        string _Balance;

        public string MyAccountNo
        {
            get
            {
                return _MyAccountNo;
            }
            set
            {
                _MyAccountNo = value;
            }
        }

        //public string OtherAccountNo
        //{
        //    get
        //    {
        //        return _OtherAccountNo;
        //    }
        //    set
        //    {
        //        _OtherAccountNo = value;
        //    }
        //}

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

        public string ReceiverName
        {
            get
            {
                return _ReceiverName;
            }
            set
            {
                _ReceiverName = value;
            }
        }

        //public string Amount
        //{
        //    get
        //    {
        //        return _Amount;
        //    }
        //    set
        //    {
        //        _Amount = value;
        //    }
        //}

        public string Balance
        {
            get
            {
                return _Balance;
            }
            set
            {
                _Balance = value;
            }
        }

        public DataSet GetMyAccountNo()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("SelectAccountNo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //public SQLDataReader GetBranchName(string branchname)
        //{
        //   string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand da = new SqlCommand("spFetchRcvrName", con);
        //        da.CommandType = CommandType.StoredProcedure;
        //        SqlParameter branch = new SqlParameter("@BranchName",branchname);
        //        da.Parameters.Add(branch);
        //        con.Open();
        //        SqlDataReader reader =da.ExecuteReader();
        //        return reader;
        //if (reader.HasRows)
        //{
        //    while (reader.Read())
        //    {
        //        Console.WriteLine("{0}\t{1}", reader.GetInt32(0),
        //            reader.GetString(1));
        //    }
        //}
        //else
        //{
        //    Console.WriteLine("No rows found.");
        //}
        //reader.Close();
        //    }


        //}

        //public DataSet GetRcvrName(string )
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        //    SqlConnection con = new SqlConnection(CS);



        //    SqlDataAdapter da = new SqlDataAdapter("spFetchRcvrName", con);

        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;


        //    DataSet ds = new DataSet();
        //    da.Fill(ds);

        //    return ds;

        //}
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
        public string GetOtherAccountNo(string name)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand da = new SqlCommand("spFetchAccountNo", con);
            da.CommandType = CommandType.StoredProcedure;

            SqlParameter Nm = new SqlParameter("@Name", name);
            da.Parameters.Add(Nm);
            con.Open();
            string s = Convert.ToString(da.ExecuteScalar());
            return s;


        }

        //public DataSet GetMyAccountNo()
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(CS);
        //    SqlDataAdapter da = new SqlDataAdapter("SelectAccountNo", con);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    return ds;
        //}

        //public DataSet GetMyAccountNo()
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(CS);
        //    SqlDataAdapter da = new SqlDataAdapter("SelectAccountNo", con);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    return ds;
        //}

        //public DataSet GetMyAccountNo()
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(CS);
        //    SqlDataAdapter da = new SqlDataAdapter("SelectAccountNo", con);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    return ds;
        //}

        public float GetBalance(string accountno)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand da = new SqlCommand("FetchBalance", con);
                da.CommandType = CommandType.StoredProcedure;
                SqlParameter acctno = new SqlParameter("@AccountNO", accountno);
                da.Parameters.Add(acctno);
                con.Open();
                //string e = da.ExecuteScalar().ToString();
                //string t = Convert.ToString(e);
                float b = Convert.ToSingle(Convert.ToString(da.ExecuteScalar()));
                return b;
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                //return ds;
            }
        }
             public SqlDataReader GetRcvrName(string accountno)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(CS);

            SqlCommand cmd = new SqlCommand("spFetchRcvrName", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AccountNo", accountno);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;

        }

        }
    }
