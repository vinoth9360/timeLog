using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;

namespace timeLog
{
    public partial class projectlist : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.DataBind();

            if (Request.HttpMethod == "POST")
            {

                if (checkuserexist())
                {
                   
                    Response.Write("<script>alert(' Already exist  ');</script>");
                }

                else
                {
                    newmwmber();
                    Response.Write("<script>alert(' Created successfully ');</script>");
                    GridView2.DataBind();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }
        bool checkuserexist()
        {

            //string id = Request.Form["id"];
            string name = Request.Form["name"];
            //string dt = Request.Form["dt"];
            //string budget = Request.Form["budget"];
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * from master_project_table where Project_name = '" + name.Trim() + "';", con);
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
              
                string name = Request.Form["name"];
                string dt = Request.Form["dt"];
                string budget = Request.Form["budget"];

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    string maxProjectIdQuery = "SELECT MAX(Project_Id) FROM master_project_table";
                    SqlCommand maxProjectIdCmd = new SqlCommand(maxProjectIdQuery, connection);
                    int maxProjectId = Convert.ToInt32(maxProjectIdCmd.ExecuteScalar());
                    int newProjectId = maxProjectId + 1;

                    // Perform user validation here (compare username and password with database records)
                    // If the user's login is successful, you can insert a log record into a log table

                    // Insert a log record (example)
                    string insertQuery = "INSERT INTO master_project_table (Project_Id,Status,Consumed,Balance,Project_name,Budget,Issuedate) VALUES (@Project_Id,'Yet to start',0,0,@Project_name,@Budget,@Issuedate)";
                    SqlCommand cmd = new SqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@Project_name", name);
                    cmd.Parameters.AddWithValue("@Project_Id", newProjectId);
                    cmd.Parameters.AddWithValue("@Issuedate", dt);
                    cmd.Parameters.AddWithValue("@Budget", budget);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = ((GridView2.PageIndex * GridView2.PageSize) + e.Row.RowIndex + 1).ToString();
            }
        }

        protected void GridView2_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = ((GridView2.PageIndex * GridView2.PageSize) + e.Row.RowIndex + 1).ToString();
            }
        }
    }
}