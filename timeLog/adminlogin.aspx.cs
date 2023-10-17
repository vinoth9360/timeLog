using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace timeLog
{
    public partial class adminlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Request.HttpMethod == "POST")
                {
                    checkuserexist();
                }
                else
                {
                }
          
            void checkuserexist()
            {
                try
                {
                    string username = Request.Form["username"];
                    string password = Request.Form["password"];
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("select * from master_admin_table where Username ='" + username.Trim() + "' AND Password='" + password.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('Successful login');</script>");
                            Session["username"] = dr.GetValue(0).ToString();
                            Session["password"] = dr.GetValue(1).ToString();
                            Session["role"] = "Admin";
                            //Session["status"] = dr.GetValue(10).ToString();
                        }
                        Response.Redirect("admindashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            
            }
        }
    }
    