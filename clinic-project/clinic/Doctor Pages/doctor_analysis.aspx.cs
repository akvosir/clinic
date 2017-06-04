using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_analysis : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindAnalysis();

            }
        }

        protected void bindAnalysis()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT analysis_name, id_analysis FROM analysis WHERE id_analysis > 0"))
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
                                app_an.DataSource = ds;
                                app_an.DataBind();

                            }

                        }
                    }
                }
            }
        }

        protected void analysisTimer()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT time(start_analysis) FROM analysis_schedule WHERE date(start_analysis) = '" + DateTime.Parse(app_an_date.Text).ToString("yyyy-MM-dd") +"' AND analysis_id = " + app_an.SelectedValue, con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        List<TimeSpan> t = new List<TimeSpan>();
                        for (int hour = 0; hour < 44; hour++)
                        {
                            t.Add(TimeSpan.FromMinutes(480 + 15 * hour));

                        }

                        List<TimeSpan> t2 = new List<TimeSpan>();
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            t2.Add(TimeSpan.Parse(reader["time(start_analysis)"].ToString()));
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

        protected void an_save_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO analysis_schedule (analysis_id, patient_id, start_analysis, end_analysis) " +
                    "VALUES (@analysis_id, @patient_id, @start_analysis, @end_analysis)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            cmd.Connection = con;
                            con.Open();
                            TimeSpan t = RadTimePicker1.SelectedTime.Value;
                            DateTime d = DateTime.Parse(app_an_date.Text).Add(t);
                            DateTime ed = d.AddMinutes(15.0);

                            cmd.Parameters.AddWithValue("@analysis_id", app_an.SelectedValue);
                            cmd.Parameters.AddWithValue("@patient_id", Int32.Parse(Request.QueryString["ID"]));
                            cmd.Parameters.AddWithValue("@start_analysis", d);
                            cmd.Parameters.AddWithValue("@end_analysis", ed);

                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            con.Close();
                            ShowNotification("Прийом збережено!", WarningType.Success);
                        }
                        catch(Exception ex) {
                            throw ex;
                        }
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

        //mild bug
        protected void app_an_SelectedIndexChanged(object sender, EventArgs e)
        {
                analysisTimer();
            
        }

        protected void app_an_date_TextChanged(object sender, EventArgs e)
        {
            analysisTimer();
        }
    }
}