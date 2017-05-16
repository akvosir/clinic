using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace clinicWeb
{
    public partial class LoginPage : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection(@"Data Source = localhost; Database = clinic; User Id = root; Password = 'root'");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OkButton_Click(object sender, EventArgs e)
        {
            connection.Open();
            MySqlCommand com = connection.CreateCommand();
            com.CommandType = System.Data.CommandType.Text;
            com.CommandText = "select * from login where username = '"+ loginTextBox.Text + "' and password = '"+ passwordTextBox.Text + "'";
            com.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = com;
            da.Fill(dt);

            //filter by type 
            foreach (DataRow dr in dt.Rows) {
                Session["username"] = dr["username"].ToString();
                Response.Redirect("~/Reception Pages/reception_cards.aspx");
            }
            connection.Close();
            
        }
    }
}