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
            if (!IsPostBack)
            {
                if (Session["page"].ToString().Equals("schedule"))
                {
                    pat_dropdown();
                    doctorspec_bind();

                    if (Session["schedule_pat"] == null)
                    {
                        doctors.ClearSelection();
                        string id = (string)Session["schedule_doc_id"];
                        doctors.SelectedValue = id;
                        getDocInfo();
                        doctor_bind();
                    }
                    else if (Session["schedule_doc_id"] == null) {
                        string id = (string)Session["schedule_pat"];
                        pat.SelectedValue = id;
                        doctor_bind();
                    }

                }
                else if (Session["page"].ToString().Equals("ci"))
                {
                    string id = Request.QueryString["ID"].ToString();
                    pat.SelectedValue = id;
                    doctorspec_bind();
                    doctor_bind();
                    pat_dropdown();

                }
            }
        }

        protected void pat_dropdown()
        {
            //after login get doctor's id
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT CONCAT_WS(' ', surname, name, fathers_name) AS 'name', idpatient_card FROM patient_card"))
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
                                pat.DataSource = ds;
                                pat.DataBind();
                            }

                        }
                    }
                }
            }
        }

        protected void getDocInfo()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT doctor_specialty FROM doctors WHERE id_doctor = " + Int32.Parse((string)Session["schedule_doc_id"])))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        specialty.ClearSelection();
                        specialty.SelectedValue = cmd.ExecuteScalar().ToString();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void doctor_bind()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT doctors.id_doctor,  CONCAT_WS(' ', doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname) AS 'name' " +
                    "FROM doctors INNER JOIN doctor_specialty ON doctor_specialty.id_specialty = doctors.doctor_specialty WHERE id_specialty = " + specialty.SelectedValue))
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

        protected void doctorspec_bind()
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
                                specialty.DataSource = ds;
                                specialty.DataBind();

                            }

                        }
                    }
                }
            }
        }

       /* protected void timeBind()
        {

            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM time_table", con))
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

                            }

                        }
                    }
                }
            }


        }*/

        protected void save_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                         //добавить сешион с датой
                        cmd.Connection = con;
                        con.Open();
                        DateTime d = DateTime.Parse(rec_app_date.Text).Add(TimeSpan.Parse(rec_app_time.Text));
                        DateTime ed = d.AddMinutes(30.0);

                        cmd.Parameters.AddWithValue("@start_app", d);
                        cmd.Parameters.AddWithValue("@end_app", ed);
                        cmd.Parameters.AddWithValue("@doctor", Int32.Parse(doctors.SelectedValue));
                        cmd.Parameters.AddWithValue("@patient", Int32.Parse(pat.SelectedValue));

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void specialty_SelectedIndexChanged(object sender, EventArgs e)
        {
            doctor_bind();
        }

        protected void doctors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}