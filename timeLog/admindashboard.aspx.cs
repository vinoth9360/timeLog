using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Runtime.Remoting.Contexts;
using System.Web.Script.Serialization;
using System.IO;

namespace timeLog
{
    public partial class admindashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public static string budget;
        public static string balance;
        public static string consumed;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow selectedRow = GridView1.SelectedRow;

            if (selectedRow != null)
            {
                string projectID = GridView1.DataKeys[selectedRow.RowIndex].Value.ToString();
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    // Construct your SQL query to retrieve data
                    string query = "SELECT * FROM master_project_table WHERE Project_name = @Project_name";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Project_name", projectID);

                    // Execute the query and retrieve the data
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        // You can access the data from the reader and display it
                        string projectbudget = reader["Budget"].ToString();
                        string projectbalance = reader["balance"].ToString();
                        string projectconsumed = reader["consumed"].ToString();
                        // Retrieve other data as needed
                        //Fetch data for the selected row
                        //(code for database retrieval as before)
                        string budget = projectbudget; // Fetch budget
                        string balance = projectbalance; // Fetch balance
                        string consumed = projectconsumed; // Fetch consumed

                        // Update the boxes with the data from the selected row
                        string script = $"<script>updateBoxes('{budget}','{consumed}','{balance}');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "UpdateBoxesScript", script);
                    }
                    else
                    {
                        // Clear the boxes or handle deselection
                        string script = "<script>updateBoxes('', '', '');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "UpdateBoxesScript", script);
                    }
                }
            }
        }
        






        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void chk_CheckedChanged(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CheckBox cb = (CheckBox)GridView1.Rows[rowind].FindControl("chk");
            if (cb.Checked == true)
            {
                // Get the selected row's data

                string projectID = GridView1.Rows[rowind].Cells[1].Text; // Assuming the ID is in the first column

                // Query the database and retrieve data based on projectID
                // You'll need to replace this with your actual database query

                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();
                    // Construct your SQL query to retrieve data
                    string query = "SELECT * FROM master_project_table WHERE Project_name = @Project_name";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Project_name", projectID);

                    // Execute the query and retrieve the data
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        // You can access the data from the reader and display it
                        string projectbudget = reader["Budget"].ToString();
                        string projectbalance = reader["balance"].ToString();
                        string projectconsumed = reader["consumed"].ToString();
                        // Retrieve other data as needed

                        // Display the data in your boxes or wherever you want
                        string budget = projectbudget; // Replace with your data
                        string balance = projectbalance; // Replace with your data
                        string consumed = projectconsumed; // Replace with your data

                        // Call the JavaScript function to update the boxes
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "UpdateBoxesScript",
                            $"updateBoxes('{budget}','{consumed}','{balance}');", true);
                    }
                    reader.Close();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
        {

        }


        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(GridView1, "Select$" + e.Row.RowIndex);
            //    e.Row.Attributes["style"] = "cursor:pointer";
            //}

        }

        protected void GridView1_RowDataBound2(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowDataBound3(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = ((GridView1.PageIndex * GridView1.PageSize) + e.Row.RowIndex + 1).ToString();
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition","attachment; filename= Allprojectdata.xls");
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
           
        }
    }
}




   
        
