using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace timeLog
{
    public partial class employeelist : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView3.DataBind();

            if (Request.HttpMethod == "POST")
            {

                if (checkuserexist())
                {

                    Response.Write("<script>alert(' Already exist  ');</script>");
                }

                else
                {
                    newmwmber();
                    Response.Write("<script>alert(' Created successfully  ');</script>");
                    GridView3.DataBind();
                }
            }
        }
        bool checkuserexist()
        {

            string id = Request.Form["id"];
            //string name = Request.Form["name"];
            //string dt = Request.Form["dt"];
            //string hw = Request.Form["HW"];
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * from master_employee_table where Emp_Id = '" + id.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            if (dt1.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }





        void newmwmber()
        {
            try
            {


                string id = Request.Form["id"];
                string name = Request.Form["name"];
                string dt = Request.Form["dt"];
                string hw = Request.Form["HW"];

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();

                    // Perform user validation here (compare username and password with database records)
                    // If the user's login is successful, you can insert a log record into a log table

                    // Insert a log record (example)
                    string insertQuery = "INSERT INTO master_employee_table (Emp_Id,Password,DoJ,Fullname,Hourlywage,Email) VALUES (@Emp_Id,'Welcome@01',@DoJ,@Fullname,@Hourlywage,@Email)";
                    SqlCommand cmd = new SqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@Emp_Id", id);
                    cmd.Parameters.AddWithValue("@DoJ", dt);
                    cmd.Parameters.AddWithValue("@Fullname", name);
                    cmd.Parameters.AddWithValue("@Hourlywage", hw);  
                    cmd.Parameters.AddWithValue("@Email", name+ "@vulcansbuild.com");
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
           
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = ((GridView3.PageIndex * GridView3.PageSize) + e.Row.RowIndex + 1).ToString();
            }
        }
    }
}