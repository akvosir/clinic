using System;
using System.Collections.Generic;
using System.Messaging;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace clinic.Admin_Pages
{
    public partial class administrator_add : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void submit_spectype_Click(object sender, EventArgs e)
        {
            requir1.Enabled = true;
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8;"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO doctor_specialty (name_specialty) VALUES (@name_specialty)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            command.Connection = con;
                            con.Open();
                            command.Parameters.AddWithValue("@name_specialty", admin_spectype.Text);
                            command.ExecuteNonQuery();
                            command.Dispose();
                            con.Close();
                            ShowNotification("Нова спеціальність додана!", WarningType.Success);
                        }
                        catch
                        {
                            ShowNotification("Спробуйте ще раз!", WarningType.Danger);
                        }

                    }
                }
            }


        }

        protected void submit_med_Click(object sender, EventArgs e)
        {


            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset = utf8;"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO medicine (medicine_name) VALUES (@medicine_name)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            command.Connection = con;
                            con.Open();
                            command.Parameters.AddWithValue("@medicine_name", admin_med.Text);
                            command.ExecuteNonQuery();
                            command.Dispose();
                            con.Close();
                            ShowNotification("Новий тип медкаментів доданий!", WarningType.Success);
                        }
                        catch
                        {
                            ShowNotification("Спробуйте ще раз!", WarningType.Danger);
                        }
                    }
                }
            }
        }

        protected void submit_antype_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset = utf8;"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO analysis (analysis_name) VALUES (@analysis_name)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {

                            command.Connection = con;
                            con.Open();
                            command.Parameters.AddWithValue("@analysis_name", admin_an.Text);
                            command.ExecuteNonQuery();
                            command.Dispose();
                            con.Close();
                            ShowNotification("Новий тип аналізу доданий!", WarningType.Success);
                        }
                        catch
                        {
                            ShowNotification("Спробуйте ще раз!", WarningType.Danger);
                        }
                    }
                }
            }
        }
    }
}