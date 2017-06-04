using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace clinic
{
    public partial class WebForm1 : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TimeSpan[] tsArray = new TimeSpan[40];
                for (int hour = 0; hour < 40; hour++)
                {
                        TimeSpan time = TimeSpan.FromMinutes(540 + 15 * hour);
                        tsArray[hour] = time;
                    
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
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root"))
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root"))
            {

                List<TimeSpan> t = new List<TimeSpan>();
                docshift(t);

                List<TimeSpan> t2 = new List<TimeSpan>();
                MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM time_table ta INNER JOIN doctor_shift ds ON ds.shift = ta.shift INNER JOIN doctor_schedule dsc ON dsc.doctor = ds.doctor_id " +
                    "WHERE date(dsc.start_app)= '" + DateTime.Parse(app_spec_date.Text).ToString("yyyy-MM-dd") + "' AND dsc.doctor = " + app_spec_name.SelectedValue +
                    " AND ta.time_app = time(dsc.start_app) AND ta.time_app >= time(ds.start)", con);
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    t2.Add(TimeSpan.Parse(reader["time_app"].ToString()));
                }
                reader.Close();

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

        protected void bindSpecialists()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root"))
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
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root"))
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

        protected void app_spec_name_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void app_spec_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void app_spec_date_TextChanged(object sender, EventArgs e)
        {
            doc();
        }
    }
}