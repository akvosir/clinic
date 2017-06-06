using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class reception_app : BootstrapPage
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
                        string date = (string)Session["schedule_date"];
                        doctors.SelectedValue = id;
                        rec_app_date.Text = date;
                        getDocInfo();
                        doctor_bind();
                        doc();
                    }
                    else if (Session["schedule_doc_id"] == null)
                    {
                        string id = (string)Session["schedule_pat"];
                        string date = (string)Session["schedule_date"];
                        pat.SelectedValue = id;
                        rec_app_date.Text = date;
                        doctor_bind();
                        doc();
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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

        protected void save_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            cmd.Connection = con;
                            con.Open();
                            TimeSpan t = RadTimePicker1.SelectedTime.Value;
                            DateTime d = DateTime.Parse(rec_app_date.Text).Add(t);
                            DateTime ed = d.AddMinutes(30.0);

                            cmd.Parameters.AddWithValue("@start_app", d);
                            cmd.Parameters.AddWithValue("@end_app", ed);
                            cmd.Parameters.AddWithValue("@doctor", Int32.Parse(doctors.SelectedValue));
                            cmd.Parameters.AddWithValue("@patient", Int32.Parse(pat.SelectedValue));

                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            con.Close();
                            ShowNotification("Прийом назначений!", WarningType.Success);
                            Response.AddHeader("REFRESH", "2; URL = reception_schedule.aspx");
                        }
                        catch(Exception ex) {
                            throw ex;
                        }
                    }
                }
            }
        }

        protected int even_odd(DateTime dat)
        {

            int f = dat.Day;
            if (f % 2 == 0) { return 0; }
            else { return 1; }
        }

        protected void docshift(List<TimeSpan> sh1)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                if (even_odd(DateTime.Parse(rec_app_date.Text)) == 0)
                {
                    MySqlCommand sh = new MySqlCommand("SELECT shift FROM `doctor_shift` WHERE doctor_id =" + doctors.SelectedValue + " AND even_odd = 0");
                    sh.Connection = con;
                    con.Open();
                    int result = Int32.Parse(sh.ExecuteScalar().ToString());

                    using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM `time_table` WHERE shift =" + result))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {
                                sh1.Add(TimeSpan.Parse(reader["time_app"].ToString()));
                            }


                        }
                    }
                }
                else
                {
                    MySqlCommand sh = new MySqlCommand("SELECT shift FROM `doctor_shift` WHERE doctor_id =" + doctors.SelectedValue + " AND even_odd = 1");
                    sh.Connection = con;
                    con.Open();
                    int result = Int32.Parse(sh.ExecuteScalar().ToString());

                    using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM `time_table` WHERE shift =" + result))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                             MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {
                                sh1.Add(TimeSpan.Parse(reader["time_app"].ToString()));
                            }


                        }
                    }
                }

            }
        }

        protected void doc()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM time_table ta INNER JOIN doctor_shift ds ON ds.shift = ta.shift INNER JOIN doctor_schedule dsc ON dsc.doctor = ds.doctor_id " +
                    "WHERE date(dsc.start_app)= '" + DateTime.Parse(rec_app_date.Text).ToString("yyyy-MM-dd") + "' AND dsc.doctor = " + doctors.SelectedValue +
                    " AND ta.time_app = time(dsc.start_app) AND ta.time_app >= time(ds.start)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            List<TimeSpan> t = new List<TimeSpan>();
                            docshift(t);

                            List<TimeSpan> t2 = new List<TimeSpan>();
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            con.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {
                                t2.Add(TimeSpan.Parse(reader["time_app"].ToString()));
                            }

                            for (int i = t.Count - 1; i >= 0; i--)
                                if (t2.Exists(h => h == t[i]))
                                {
                                    t.RemoveAt(i);
                                }

                            TimeSpan[] time = new TimeSpan[t.Count];
                            for (int i = 0; i < t.Count; i++)
                            {
                                time[i] = t[i];
                            }

                            RadTimePicker1.TimeView.CustomTimeValues = time;
                        }
                        catch (Exception ex){
                            throw ex;
                        }
                    }
                }
            }
        }

        protected void specialty_SelectedIndexChanged(object sender, EventArgs e)
        {
            doctor_bind();
        }

        protected void rec_app_date_TextChanged(object sender, EventArgs e)
        {
            doc();
        }

        protected void doctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            doc();
        }
    }
}