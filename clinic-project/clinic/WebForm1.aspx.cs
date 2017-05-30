using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;


namespace clinic
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {

            }
            
        }

        //
        protected int even_odd(DateTime dat) {

            int f = dat.Day;
            if (f % 2 == 0) { return 0; }
            else { return 1; }
        }

        protected void docshift(List<TimeSpan> sh1)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                MySqlCommand sh = new MySqlCommand("SELECT shift FROM `doctor_shift` WHERE doctor_id = 5 AND even_odd = 0" );
                sh.Connection = con;
                con.Open();
                int result = Int32.Parse(sh.ExecuteScalar().ToString());

                using (MySqlCommand cmd = new MySqlCommand("SELECT time_app FROM `time_table` WHERE shift =" +result))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            sh1.Add(TimeSpan.Parse(reader["time_app"].ToString()));
                        }


                    }
                }
            }
        }

        protected void doc(){
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT time_app  FROM `time_table` INNER JOIN doctor_shift ON doctor_shift.shift = time_table.shift " +
                    "INNER JOIN doctor_schedule ON doctor_schedule.doctor = doctor_shift.doctor_id WHERE date(doctor_schedule.start_app)= '2017-05-28' AND time_app = time(doctor_schedule.start_app)  " +
                    "AND doctor_schedule.doctor = 1 AND time_app >= time(doctor_shift.start) AND doctor_shift.even_odd = 0"))
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

        protected void date_TextChanged(object sender, EventArgs e)
        {
            even_odd(DateTime.Parse(date.Text));
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }
    }
}