using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace timeLog
{
    public partial class contact : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                // Retrieve form data
                string firstName = Request.Form["firstName"];
                string lastName = Request.Form["lastName"];
                string email = Request.Form["email"];
                string message = Request.Form["message"];

                // Define the SQL connection string
                string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

                // Insert data into the database
                using (SqlConnection connection = new SqlConnection(strcon))
                {
                    connection.Open();

                    string insertQuery = "INSERT INTO [master_contact_table] (FirstName, LastName, Email, Message) " +
                                         "VALUES (@FirstName, @LastName, @Email, @Message)";

                    SqlCommand cmd = new SqlCommand(insertQuery, connection);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Your request has been sent successfully');</script>");
                //Response.Write("<script>alert(Your Request has been sent successfully)<script>");
                // Redirect or display a success message
                // Response.Redirect("thank-you.html"); // Redirect to a thank-you page
            }
        }
    }
}