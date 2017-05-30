using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_specialist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                bindSpecialists();
                bindSpecialistsByName();
                string f = Request.QueryString["ID"];
            }
        }

        protected void bindSpecialists()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM doctor_specialty WHERE id_specialty > 0", con))
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
                                app_spec.DataSource = ds;
                                app_spec.DataBind();
                                
                            }

                        }
                    }
                }
            }
        }

        protected void bindSpecialistsByName()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name', id_doctor " +
                    "FROM doctors WHERE doctor_specialty = " + "'" + app_spec.SelectedValue + "'"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable ds = new DataTable())
                        {
                            sda.Fill(ds);
                            app_spec_name.DataSource = ds;
                            app_spec_name.DataBind();

                        }
                    }
                }
            }
        }

        protected void make_app_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        DateTime d = DateTime.Parse(app_spec_date.Text).Add(TimeSpan.Parse(app_spec_time.Text));
                        DateTime ed = d.AddMinutes(30.0);

                        cmd.Parameters.AddWithValue("@start_app", d);
                        cmd.Parameters.AddWithValue("@end_app", ed);
                        cmd.Parameters.AddWithValue("@doctor", 2);
                        cmd.Parameters.AddWithValue("@patient", Int32.Parse(Request.QueryString["ID"]));
        
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void sc_Click(object sender, EventArgs e)
        {
            Response.Redirect("doctor_schedule.aspx?");
        }

        protected void sp_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("doctor_specialist.aspx?ID=" + Server.UrlEncode(id));
        }

        protected void an_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("doctor_analysis.aspx?ID=" + Server.UrlEncode(id));
        }

        protected void app_spec_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSpecialistsByName();
        }
    }
}