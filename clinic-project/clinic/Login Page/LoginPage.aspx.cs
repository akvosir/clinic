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


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OkButton_Click(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(@"Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'");
            connection.Open();
            MySqlCommand com = connection.CreateCommand();
            com.CommandType = CommandType.Text;
            com.CommandText = "SELECT * FROM staff_login WHERE login = '" + loginTextBox.Text + "' and password = '" + passwordTextBox.Text + "'";
            com.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = com;
            dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["login"] = loginTextBox.Text;
                if (dt.Rows[0]["type"].ToString() == "Лікар")
                {
                    Response.Redirect("~/Doctor Pages/doctor_schedule.aspx");
                }
                else if (dt.Rows[0]["type"].ToString() == "Адміністратор")
                {
                    Response.Redirect("~/Admin Pages/administration_schedule_manag.aspx");
                }
                else if (dt.Rows[0]["type"].ToString() == "Реєстратура")
                {
                    Response.Redirect("~/Reception Pages/reception_cards.aspx");
                }
            }
            else
            {
                loginTextBox.Text = "";
                passwordTextBox.Text = "";

                ClientScript.RegisterStartupScript(GetType(), "Alert message", "<script type='text/javascript'>alert('Невірний логін або пароль!')</script>");
            }

            connection.Close();

        }
    }
}