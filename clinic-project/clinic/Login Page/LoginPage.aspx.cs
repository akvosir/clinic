using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class LoginPage : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
            }
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
                    doctor();
                    Response.Redirect("~/Doctor Pages/doctor_schedule.aspx");
                }
                else if (dt.Rows[0]["type"].ToString() == "Адміністратор")
                {
                    user();
                    Response.Redirect("~/Admin Pages/administration_schedule_manag.aspx");
                }
                else if (dt.Rows[0]["type"].ToString() == "Реєстратура")
                {
                    user();
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

        protected void user() {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM staff_login WHERE login = '" + loginTextBox.Text + "' and password = '" + passwordTextBox.Text + "'"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            UserS.id = reader.GetInt32(0);
                            UserS.surname = reader.GetString(3);
                            UserS.name = reader.GetString(4);
                            UserS.fathers_name = reader.GetString(5);

                        }

                        con.Close();
                    }
                }
            }
        }

        protected void doctor()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT id_doctor, doctor_name, doctor_surname, doctor_fathersname FROM staff_login INNER JOIN doctors ON staff_login.surname = doctors.doctor_surname" +
                    " WHERE login = '" + loginTextBox.Text + "' and password = '" + passwordTextBox.Text + "'"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            UserS.id = reader.GetInt32(0);
                            UserS.surname = reader.GetString(2);
                            UserS.name = reader.GetString(1);
                            UserS.fathers_name = reader.GetString(3);

                        }

                        con.Close();
                    }
                }
            }
        }
    }
}