using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace timeLog
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string empId = siign.username;
        protected void Page_Load(object sender, EventArgs e)
        {

            {
                // Replace this with your actual logic

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * from master_employee_table where Emp_Id= '" + empId.Trim() + " '", connection);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            string pass = dr.GetValue(1).ToString();
                            string doj = dr.GetValue(2).ToString();
                            string names = dr.GetValue(3).ToString();

                            id.Value = empId;
                            name.Value = names;
                            date.Value = doj;
                            oldpass.Value = pass;


                        }
                    }
                    if (Request.HttpMethod == "POST")
                    {
                        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

                        // string username = Request.Form["username"];
                        //tring password = Request.Form["password"];
                        if (newpass.Value == newpassc.Value & newpassc.Value != "")
                        {
                            using (SqlConnection con = new SqlConnection(strcon))
                            {
                                con.Open();
                                string cmd1 = "update master_employee_table set Password = @Password where Emp_Id = '" + empId.Trim() + " '";
                                SqlCommand cmd2 = new SqlCommand(cmd1, con);
                                cmd2.Parameters.AddWithValue("@Password", newpass.Value);
                                cmd2.ExecuteNonQuery();
                                con.Close();
                            }
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "closeFormScript", "closeForm();", true);
                            Response.Write("New Password updated Successfully");
                        }
                        else if (newpassc.Value == "" && newpass.Value == "")
                        {
                            Response.Write("Please Enter new password");
                        }

                    }
                }
            }
        }
    }
}
