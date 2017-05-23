using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_card : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["ID"];
                patientInfo(Int32.Parse(id));
                bindSpecialists();
                bindAnalysis();
                bindMedicine();
            }
        }

        protected void addVisitData(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO visits (visit_date, reason, symptoms, diagnosis, med_name, med_start, med_end, recom_consult, recom_analysis, " +
                    "next_visit, patient_id, doctor_id) VALUES ( @visit_date, @reason, @symptoms, @diagnosis, @med_name, @med_start, @med_end, @recom_consult, @recom_analysis, " +
                    "@next_visit, @patient_id, @doctor_id)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.Parameters.AddWithValue("@visit_date", DateTime.Now);
                        cmd.Parameters.AddWithValue("@reason", dc_reason.Text);
                        cmd.Parameters.AddWithValue("@symptoms", dc_symptoms.Text);
                        cmd.Parameters.AddWithValue("@diagnosis", dc_diagnosis.Text);
                        cmd.Parameters.AddWithValue("@med_name", medicine.SelectedValue);
                        cmd.Parameters.AddWithValue("@med_start", med_st.Text);
                        cmd.Parameters.AddWithValue("@med_end", med_en.Text);
                        cmd.Parameters.AddWithValue("@recom_consult", specialists.SelectedValue);
                        cmd.Parameters.AddWithValue("@recom_analysis", analysis.SelectedValue);
                        cmd.Parameters.AddWithValue("@next_visit", DateTime.Parse(dc_next.Text));
                        cmd.Parameters.AddWithValue("@patient_id", id);
                        cmd.Parameters.AddWithValue("@doctor_id", 1); //get id from login form

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        public static int GetAge(DateTime reference, DateTime birthday)
        {
            int age = reference.Year - birthday.Year;
            if (reference < birthday.AddYears(age)) age--;

            return age;
        }

        protected void patientInfo(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT name, surname, fathers_name, birthday FROM patient_card WHERE idpatient_card = " + id))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            pat_name.Text = reader.GetString(1) + " " + reader.GetString(0) + " " + reader.GetString(2);
                            pat_age.Text = GetAge(DateTime.Now, reader.GetDateTime(3)).ToString();
                            vis_date.Text = DateTime.Now.ToString("dd MMMM yyyy");
                        }

                        con.Close();
                    }
                }
            }
        }

        protected void bindMedicine()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT medicine_name FROM medicine"))
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
                                medicine.DataSource = ds;
                                medicine.DataBind();
                            }

                        }
                    }
                }
            }
        }

        protected void bindSpecialists()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM doctor_specialty"))
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
                                specialists.DataSource = ds;
                                specialists.DataBind();
                            }

                        }
                    }
                }
            }
        }


        protected void bindAnalysis()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT analysis_name FROM analysis"))
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
                                analysis.DataSource = ds;
                                analysis.DataBind();
                            }

                        }
                    }
                }
            }
        }

        protected void add_med_Click(object sender, EventArgs e)
        {
            

        }

        protected void add_visit_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            addVisitData(Int32.Parse(id));
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
    }
}
  