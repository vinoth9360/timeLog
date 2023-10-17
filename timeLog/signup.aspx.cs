using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace timeLog
{
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
               // string username = Request.Form["username"];
               //tring password = Request.Form["password"];
                if (checkMemberExists())
                {
                    Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
                }
                else
                {
                    newmember();
                    Response.Write("<script>alert('Successfully Signed Up');</script>");
                    Response.Redirect("userdashoard.aspx");
                }
            }
        bool checkMemberExists()
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
                SqlCommand cmd = new SqlCommand("SELECT * from master_employee_table where Emp_Id='" + username.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void newmember()
        {
                try
                {
                    string username = Request.Form["username"];
                    string password = Request.Form["password"];



                    using (SqlConnection connection = new SqlConnection(strcon))
                    {
                        connection.Open();

                        // Perform user validation here (compare username and password with database records)
                        // If the user's login is successful, you can insert a log record into a log table

                        // Insert a log record (example)
                        string insertQuery = "INSERT INTO master_employee_table (Emp_Id, Password) VALUES (@Emp_Id, @Password)";
                        SqlCommand cmd = new SqlCommand(insertQuery, connection);
                        cmd.Parameters.AddWithValue("@Emp_Id", username);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.ExecuteNonQuery();
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                  
                }
               
              
            }
        }
    }
}