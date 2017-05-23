using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_analysis : System.Web.UI.Page
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
            using (MySqlConnection con = new MySqlConnection(@"Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Pwd = jnFq8Gk5Gk"))
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
                                app_an.DataSource = ds;
                                app_an.DataBind();

                            }

                        }
                    }
                }
            }
        }

        protected void an_save_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO analysis_schedule (analysis_id, patient_id, start_analysis, end_analysis) " +
                    "VALUES (@analysis_id, @patient_id, @start_analysis, @end_analysis)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        DateTime d = DateTime.Parse(app_an_date.Text).Add(TimeSpan.Parse(app_an_time.Text));
                        DateTime ed = d.AddMinutes(30.0);

                        cmd.Parameters.AddWithValue("@analysis_id", app_an.SelectedValue);
                        cmd.Parameters.AddWithValue("@patient_id", Int32.Parse(Request.QueryString["ID"]));
                        cmd.Parameters.AddWithValue("@start_analysis", d);
                        cmd.Parameters.AddWithValue("@end_analysis", ed);

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
    }
}