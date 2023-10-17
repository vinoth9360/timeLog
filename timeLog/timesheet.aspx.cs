using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;
using System.Threading.Tasks;

namespace timeLog
{
    public partial class timesheet : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public static double consumed;
        public static int balance;
        public static double Budget;
        public static double Oldconsumed;
        public static double newconsumed;
        public static double Hourlywages;
        public static double Totaltime;
        public static string emp_id;
        public static string projectID;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Check if the user is authenticated and get their Emp_Id (you need to implement this logic)

                string empId = siign.username; // Replace this with your actual logic

                // Modify the SQL query with a WHERE clause to filter by Emp_Id
                SqlDataSource1.SelectCommand = "SELECT * FROM [transaction_timesheet_table] WHERE Emp_Id = @EmpId";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("EmpId", empId);


                // Bind the data to the GridView
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
                List<string> projectNames = GetProjectNames();
                ddlProjectNames.DataSource = projectNames;
                ddlProjectNames.DataBind();
            }

            if (Request.HttpMethod == "POST")
            {
                // string username = Request.Form["username"];
                //tring password = Request.Form["password"];
                if (!checkMemberExists())
                {
                    Response.Write("<script>alert('You have already submitted ');</script>");
                   

                }
                else
                {
                    newmember();
                    Response.Write("<script>alert(' Submitted Successfully ');</script>");
                   
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {

        }
        protected List<string> GetProjectNames()
        {
            List<string> projectNames = new List<string>();

            // Replace this with your actual database query to retrieve project names
            // Example: Using SqlConnection, SqlCommand, and SqlDataReader to fetch data
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT Project_name FROM master_project_table", connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            projectNames.Add(reader["Project_name"].ToString());
                        }
                    }
                }
            }

            return projectNames;
        }


        bool checkMemberExists()
        {
            try
            {
                //string Id = Request.Form["id"];
                string name = Request.Form["ddlProjectNames"];
                string Task = Request.Form["task"];
                string TaskDesc = Request.Form["TextArea1"];
                string Date = Request.Form["dt"];
                string Emp_id = siign.username;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from transaction_timesheet_table where Date='" + Date.Trim() + "' AND Emp_Id='" + Emp_id.Trim() + "' AND Project_name='" + name.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return false;
                }
                else
                {
                    return true;
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
                string Id = Request.Form["id"];
                string name = Request.Form["ddlProjectNames"];
                string Task = Request.Form["task"];
                string TaskDesc = Request.Form["TextArea1"];
                string Date = Request.Form["dt"];
                string Totime = Request.Form["Time"];
                string Emp_id = siign.username;



                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();

                    // Perform user validation here (compare username and password with database records)
                    // If the user's login is successful, you can insert a log record into a log table

                    // Insert a log record (example)
                    string insertQuery = "INSERT INTO transaction_timesheet_table (Emp_Id,Project_name,Task,Task_desc,Total_time,Date) VALUES (@Emp_Id,@Project_name,@Task,@Task_desc,@Total_time,@Date)";
                    SqlCommand cmd = new SqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@Emp_Id", Emp_id);
                    //cmd.Parameters.AddWithValue("@Project_Id", Id);
                    cmd.Parameters.AddWithValue("@Project_name", name);
                    cmd.Parameters.AddWithValue("@Task_desc", TaskDesc);
                    cmd.Parameters.AddWithValue("@Task", Task);
                    cmd.Parameters.AddWithValue("@Total_time", Totime);
                    cmd.Parameters.AddWithValue("@Date", Date);
                    cmd.ExecuteNonQuery();
                }
                budgetupdation();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

            void budgetupdation()
            {
                string Id = Request.Form["id"];
                string name = Request.Form["ddlProjectNames"];
                string Task = Request.Form["task"];
                string TaskDesc = Request.Form["TextArea1"];
                string Date = Request.Form["dt"];
                string Totime = Request.Form["Time"];
                string Emp_id = siign.username;

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * from master_employee_table where Emp_Id= '" + Emp_id.Trim() + " '", connection);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            string Hwage = dr.GetValue(5).ToString();
                            Hourlywages = Convert.ToDouble(Hwage);
                        }
                    }
                }
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    SqlCommand cmd1 = new SqlCommand("SELECT * from master_project_table where Project_name= '" + name.Trim() + " '", connection);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        while (dr1.Read())
                        {
                            string budget = dr1.GetValue(2).ToString();
                            string oldconsumed = dr1.GetValue(3).ToString();
                            Budget = Convert.ToDouble(budget);
                            Oldconsumed = Convert.ToDouble(oldconsumed);
                        }
                    }
                }
                Totaltime = Convert.ToDouble(Totime);
                consumed = Convert.ToDouble(Totaltime * Hourlywages);
                balance = Convert.ToInt32(Budget - consumed);
                newconsumed = Oldconsumed + consumed;
                int updateconsumed = Convert.ToInt32(newconsumed);

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    string cmd1 = "Update master_project_table set Consumed = @consumed,Balance = @balance where Project_name= '" + name.Trim() + " '";
                    SqlCommand cmd = new SqlCommand(cmd1, connection);
                    cmd.Parameters.AddWithValue("@Consumed", updateconsumed);
                    cmd.Parameters.AddWithValue("@Balance", balance);
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = ((GridView1.PageIndex * GridView1.PageSize) + e.Row.RowIndex + 1).ToString();
            }
        }

        protected void ddlProjectNames_SelectedIndexChanged(object sender, EventArgs e)
        { // Get the selected project name
            
        }
       
    }
}
        
        
    


