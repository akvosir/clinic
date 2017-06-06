using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_card : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["ID"];
                patientInfo(Int32.Parse(id));
                bindSpecialists();
                bindAnalysis();
                bindMedicine(medicine);
                bindMedicine(medicine1);
                bindMedicine(medicine2);
            }
        }

        protected void addVisitData(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                MySqlCommand com = new MySqlCommand("SELECT EXISTS(SELECT * FROM visits WHERE visit_date <= @date AND doctor_id = @doctor AND patient_id = @patient)");
                com.Connection = con;
                con.Open();
                com.Parameters.AddWithValue("@date", DateTime.Now.Date);
                com.Parameters.AddWithValue("@doctor", UserS.id);
                com.Parameters.AddWithValue("@patient", Int32.Parse(Request.QueryString["ID"]));
                int num = Int32.Parse(com.ExecuteScalar().ToString());
                if (num == 0)
                {
                    using (MySqlCommand cmd = new MySqlCommand("INSERT INTO visits (visit_date, reason, symptoms, diagnosis, recom_consult, recom_analysis, " +
                    "next_visit, patient_id, doctor_id) VALUES ( @visit_date, @reason, @symptoms, @diagnosis, @recom_consult, @recom_analysis, " +
                    "@next_visit, @patient_id, @doctor_id)", con))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            try
                            {
                                var collection = RadComboBox1.CheckedItems;
                                string str = string.Empty;
                                foreach (var item in collection)
                                {
                                    str += item.Text + ", ";
                                }


                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@visit_date", DateTime.Now);
                                cmd.Parameters.AddWithValue("@reason", dc_reason.Text);
                                cmd.Parameters.AddWithValue("@symptoms", dc_symptoms.Text);
                                cmd.Parameters.AddWithValue("@diagnosis", dc_diagnosis.Text);
                                cmd.Parameters.AddWithValue("@recom_consult", specialists.SelectedValue);
                                cmd.Parameters.AddWithValue("@recom_analysis", str.Trim().TrimEnd(','));
                                cmd.Parameters.AddWithValue("@next_visit", DateTime.Parse(dc_next.Text));
                                cmd.Parameters.AddWithValue("@patient_id", id);
                                cmd.Parameters.AddWithValue("@doctor_id", UserS.id);

                                cmd.ExecuteNonQuery();
                                cmd.Dispose();
                                con.Close();
                                ShowNotification("Дані про візит додані!", WarningType.Success);
                            }
                            catch (Exception ex)
                            {
                                throw ex;
                            }
                        }
                    }
                }
                else
                {
                    ShowNotification("Візит вже здійснений!", WarningType.Danger);
                    Response.AddHeader("REFRESH", "2; URL = doctor_schedule.aspx");
                }



            }
        }

        protected void addMedicine(DropDownList drop, TextBox t1, TextBox t2, TextBox t3)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root"))
            {
                MySqlCommand com = new MySqlCommand("SELECT id_visit FROM visits WHERE visit_date = @date AND doctor_id = @doctor AND patient_id = @patient");
                com.Parameters.AddWithValue("@date", DateTime.Now.Date);
                com.Parameters.AddWithValue("@doctor", UserS.id);
                com.Parameters.AddWithValue("@patient", Int32.Parse(Request.QueryString["ID"]));
                com.Connection = con;

                con.Open();
                int num = Int32.Parse(com.ExecuteScalar().ToString());

                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO medicine_patient (id_medicine, id_visit, start_med, end_med, howtotake) " +
                    "VALUES (@id_medicine, @id_visit, @start_med, @end_med, @howtotake)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Parameters.AddWithValue("@id_medicine", drop.SelectedValue);
                        cmd.Parameters.AddWithValue("@id_visit", num);
                        cmd.Parameters.AddWithValue("@start_med", DateTime.Parse(t2.Text));
                        cmd.Parameters.AddWithValue("@end_med", DateTime.Parse(t3.Text));
                        cmd.Parameters.AddWithValue("@howtotake", t1.Text);

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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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



        protected void bindMedicine(DropDownList table)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT medicine_name, id_medicine FROM medicine"))
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
                                table.DataSource = ds;
                                table.DataBind();

                            }

                        }
                    }
                }
            }
        }

        protected void bindSpecialists()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id_analysis, analysis_name FROM analysis"))
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
                                RadComboBox1.DataSource = ds;
                                RadComboBox1.DataBind();

                            }

                        }
                    }
                }
            }
        }

        protected void add_visit_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            addVisitData(Int32.Parse(id));

            if (!string.IsNullOrEmpty(med_take.Text))
            {
                addMedicine(medicine, med_take, med_st, med_en);
            }
            if (!string.IsNullOrEmpty(med_take1.Text))
            {
                addMedicine(medicine1, med_take1, med_st1, med_en1);
            }
            if (!string.IsNullOrEmpty(med_take2.Text))
            {
                addMedicine(medicine2, med_take2, med_st2, med_en2);
            }
            Response.Redirect("doctor_specialist.aspx?ID=" + Server.UrlEncode(id));

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
