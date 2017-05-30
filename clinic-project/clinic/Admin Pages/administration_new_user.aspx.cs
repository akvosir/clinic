using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class administration_new_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSpec();
                
            }
        }
        private String staffType()
        {
            if (adm_type.SelectedValue.Equals("1"))
            {
                return "Працівник реєстратури";
            }
            else if (adm_type.SelectedValue.Equals("2"))
            {
                return "Лікар";
            }
            else if (adm_type.SelectedValue.Equals("3"))
            {
                return "Адміністратор";
            }
            else
                return "0";

        }

        protected void addStaffMember()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO staff_login (login, password, surname, name, fathers_name, type) " +
                    "VALUES (@login, @password, @surname, @name, @fathers_name, @type)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        command.Connection = con;
                        con.Open();
                        command.Parameters.AddWithValue("@login", admin_login.Text);
                        command.Parameters.AddWithValue("@password", admin_password.Text);
                        command.Parameters.AddWithValue("@surname", admin_surname.Text);
                        command.Parameters.AddWithValue("@name", admin_name.Text);
                        command.Parameters.AddWithValue("@fathers_name", admin_fathers.Text);
                        command.Parameters.AddWithValue("@type", staffType());

                        command.ExecuteNonQuery();
                        command.Dispose();
                        con.Close();
                    }
                }
            }

        }

        protected void bindSpec() {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM doctor_specialty WHERE id_specialty > 0"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable ds = new DataTable())
                        {
                            sda.Fill(ds);
                            if (ds.Rows.Count > 0)
                            {
                                admin_dspec.DataSource = ds;
                                admin_dspec.DataBind(); 
                            }

                        }
                    }
                }
            }
        }

        protected void addDoctor() {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO doctors (doctor_surname, doctor_name, doctor_fathersname, doctor_specialty, doctor_room) " +
                    "VALUES (@doctor_surname, @doctor_name, @doctor_fathersname, @doctor_specialty, @doctor_room)"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {

                        command.Connection = con;
                        con.Open();
                        command.Parameters.AddWithValue("@doctor_surname", admin_surname.Text);
                        command.Parameters.AddWithValue("@doctor_name", admin_name.Text);
                        command.Parameters.AddWithValue("@doctor_fathersname", admin_fathers.Text);
                        command.Parameters.AddWithValue("@doctor_specialty", Int32.Parse(admin_dspec.SelectedValue));
                        command.Parameters.AddWithValue("@doctor_room", Int32.Parse(admin_droom.Text));

                        command.ExecuteNonQuery();
                        command.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void submit_staff_Click(object sender, EventArgs e)
        {
            if (adm_type.SelectedValue.Equals("2"))
            {
                addStaffMember();
                addDoctor();
            }
            else {
                addStaffMember();
            }
                
        }

        protected void admin_dspec_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (adm_type.SelectedValue.Equals("2"))
            {
                admin_dspec.Visible = true;
                admin_droom.Visible = true;
            }
            else
            {
                admin_dspec.Visible = false;
                admin_droom.Visible = false;
            }
        }
    }
}
