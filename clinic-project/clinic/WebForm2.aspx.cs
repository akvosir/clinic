using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updateDB()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("UPDATE testing SET name = @name, value = @value, rt = @rt WHERE id = 2"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@value", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@rt", TextBox3.Text); //date

                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

        protected void butt_Click(object sender, EventArgs e)
        {
            updateDB();
        }
    }
}