using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class reception_app : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                rec_app_patname.Text = Request.QueryString["name"];
                doctor_bind();
            }
        }

        protected void doctor_bind() {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT doctors.id_doctor,  CONCAT_WS(' ', doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname) AS 'name' " +
                    "FROM `doctor_specialty` INNER JOIN doctors ON id_specialty = doctors.doctor_specialty WHERE id_specialty = 1", con))
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
                               doctors.DataSource = ds;
                               doctors.DataBind();

                            }

                        }
                    }
                }
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        DateTime d = DateTime.Parse(rec_app_date.Text).Add(TimeSpan.Parse(rec_app_time.Text));
                        DateTime ed = d.AddMinutes(30.0);

                        cmd.Parameters.AddWithValue("@start_app", d);
                        cmd.Parameters.AddWithValue("@end_app", ed);
                        cmd.Parameters.AddWithValue("@doctor", doctors.SelectedValue);
                        cmd.Parameters.AddWithValue("@patient", Request.QueryString["ID"]);

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }
    }
}