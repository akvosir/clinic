﻿using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Messaging;

namespace clinic.Doctor_Pages
{
    public partial class doctor_specialist : BootstrapPage
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root"))
            {
                MySqlCommand com = new MySqlCommand("SELECT EXISTS(SELECT * FROM doctor_schedule WHERE start_app = @date AND doctor= @doctor AND patient = @patient)");
                com.Connection = con;
                con.Open();
                com.Parameters.AddWithValue("@date", DateTime.Parse(app_spec_date.Text).Add(RadTimePicker1.SelectedTime.Value));
                com.Parameters.AddWithValue("@doctor", app_spec_name.SelectedValue);
                com.Parameters.AddWithValue("@patient", Int32.Parse(Request.QueryString["ID"]));
                int num = Int32.Parse(com.ExecuteScalar().ToString());

                if (num == 0)
                {
                    using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            TimeSpan t = RadTimePicker1.SelectedTime.Value;
                            DateTime d = DateTime.Parse(app_spec_date.Text).Add(t);
                            DateTime ed = d.AddMinutes(30.0);

                            cmd.Parameters.AddWithValue("@start_app", d);
                            cmd.Parameters.AddWithValue("@end_app", ed);
                            cmd.Parameters.AddWithValue("@doctor", app_spec_name.SelectedValue);
                            cmd.Parameters.AddWithValue("@patient", Int32.Parse(Request.QueryString["ID"]));

                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            con.Close();
                            ShowNotification("Прийом назначено!", WarningType.Danger);
                        }
                    }
                }
                else
                {
                    ShowNotification("Запис вже існує!", WarningType.Danger);
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
                if (even_odd(DateTime.Parse(app_spec_date.Text)) == 0)
                {
                    MySqlCommand sh = new MySqlCommand("SELECT shift FROM `doctor_shift` WHERE doctor_id =" + app_spec_name.SelectedValue + " AND even_odd = 0");
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
                    MySqlCommand sh = new MySqlCommand("SELECT shift FROM `doctor_shift` WHERE doctor_id =" + app_spec_name.SelectedValue + " AND even_odd = 1");
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM time_table ta INNER JOIN doctor_shift ds ON ds.shift = ta.shift INNER JOIN doctor_schedule dsc ON dsc.doctor = ds.doctor_id " +
                    "WHERE date(dsc.start_app)= '" + DateTime.Parse(app_spec_date.Text).ToString("yyyy-MM-dd") + "' AND dsc.doctor = " + app_spec_name.SelectedValue +
                    " AND ta.time_app = time(dsc.start_app) AND ta.time_app >= time(ds.start)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
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

        protected void app_spec_name_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.app_spec_date.Text))
            {
                doc();
            }
        }

        protected void app_spec_date_TextChanged(object sender, EventArgs e)
        {
            doc();
        }
    }
}