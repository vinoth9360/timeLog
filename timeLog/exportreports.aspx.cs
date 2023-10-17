using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace timeLog
{
    public partial class exportrepotrs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                List<string> projectNames = GetProjectNames();
                ddlProjectNames.DataSource = projectNames;
                ddlProjectNames.DataBind();

                //List<string> empnames = getempNames();
                //empNames.DataSource = empnames;
                //empNames.DataBind();
            }

            if (Request.HttpMethod == "POST")
            {

                Getdata();
                {
                    Response.Write("<script>alert('You have already submitted ');</script>");
                }
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
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
        //protected List<string> getempNames()
        //{
        //    List<string> projectNames = new List<string>();

        //    // Replace this with your actual database query to retrieve project names
        //    // Example: Using SqlConnection, SqlCommand, and SqlDataReader to fetch data
        //    using (SqlConnection connection = new SqlConnection(strcon))
        //    {
        //        connection.Open();
        //        using (SqlCommand cmd = new SqlCommand("SELECT Emp_Id FROM master_employee_table", connection))
        //        {
        //            using (SqlDataReader reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    projectNames.Add(reader["Emp_Id"].ToString());
        //                }
        //            }
        //        }
        //    }

        //    return projectNames;
        //}
        protected List<string> Getdata()
        {
            List<string> projectNames = new List<string>();

            // Replace this with your actual database query to retrieve project names
            // Example: Using SqlConnection, SqlCommand, and SqlDataReader to fetch data
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT Emp_Id FROM master_employee_table", connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            projectNames.Add(reader["Emp_Id"].ToString());
                        }
                    }
                }
            }

            return projectNames;
        }

    }

}