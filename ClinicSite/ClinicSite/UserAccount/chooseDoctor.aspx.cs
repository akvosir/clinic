using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicSite
{
    public partial class chooseDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSpecialistsByName();
                fillVisitsDropdown();
            }

            HttpContext context = HttpContext.Current;
            if (context.Session["telephone"] != null)
            {
                string uPhone = Session["telephone"].ToString();
                UserName.Text = Session["UserName"].ToString();
            }

        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }

        protected int? GetUserID(string patientPhoneNum)
        {
            using (MySqlConnection cnn = Connection())
            {
                try
                {
                    MySqlCommand cmd = cnn.CreateCommand();

                    cmd.CommandText = "SELECT id_patient FROM patient_login WHERE telephone = '" + patientPhoneNum + "'";

                    cnn.Open();
                    var res = cmd.ExecuteScalar();

                    if (res != null)
                        return int.Parse(res.ToString());
                }
                catch (Exception ex)
                {
                }
                return null;
            }
        }

        protected void bindSpecialistsByName()
        {
            using (MySqlConnection con = Connection())
            {
                using (MySqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT  id_doctor, CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name'" +
                        "FROM doctors WHERE doctor_specialty ='1'";

                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable ds = new DataTable())
                        {
                            sda.Fill(ds);
                            therapeutist.DataSource = ds;
                            therapeutist.DataBind();

                            //deleteVisit.DataSource = ds;
                            //deleteVisit.DataBind();

                        }
                    }
                }
            }
        }

        protected void fillVisitsDropdown()
        {
            HttpContext context = HttpContext.Current;
            if (context.Session["id"] != null)
            {
                using (MySqlConnection con = Connection())
                {
                    using (MySqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT id_app, CONCAT_WS(' ', doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname, ' ', start_app) AS 'name' " +
                            "FROM doctor_schedule INNER JOIN doctors ON doctor = doctors.id_doctor WHERE patient = " + Session["id"];

                        MySqlDataAdapter sda = new MySqlDataAdapter();
                        
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        DataTable ds = new DataTable();
                           
                        sda.Fill(ds);
                        deleteVisit.DataSource = ds;
                        deleteVisit.DataBind();  
                    }
                }
            }
        }

        protected void VisitDel_Click(object sender, EventArgs e)
        {
            using (MySqlConnection cnn = Connection())
            {
                try
                {
                    if (deleteVisit.SelectedIndex < 0) return;

                    MySqlCommand cmd = cnn.CreateCommand();
                    cmd.CommandText = "DELETE FROM doctor_schedule WHERE id_app = " + deleteVisit.SelectedValue;

                    cnn.Open();
                    var res = cmd.ExecuteNonQuery();

                    Response.Redirect("chooseDoctor.aspx?");
                }
                catch (Exception ex) { }
            }
        }

        protected void make_app_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = Connection())
            {
                using (MySqlCommand cmd = con.CreateCommand())
                {
                    HttpContext context = HttpContext.Current;
                    if (context.Session["telephone"] != null)
                    {
                        int? id = GetUserID((string)Session["telephone"]);
                        if (!id.HasValue) return;

                        cmd.CommandText = "INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)";
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            
                            con.Open();
                            DateTime d = DateTime.Parse(app_spec_date.Text).Add(TimeSpan.Parse(app_spec_time.Text));
                            DateTime ed = d.AddMinutes(30.0);

                            cmd.Parameters.AddWithValue("@start_app", d);
                            cmd.Parameters.AddWithValue("@end_app", ed);
                            cmd.Parameters.AddWithValue("@doctor", therapeutist.SelectedValue);
                            cmd.Parameters.AddWithValue("@patient", id.Value);

                            cmd.ExecuteNonQuery();
                            con.Close();

                            Response.Redirect("chooseDoctor.aspx?");
                        }
                    }
                }
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Site.aspx");
        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Session["UserName"] = UserName.Text;
            Response.Redirect("chooseDoctor.aspx?");
        }

        protected void visits_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("Visits.aspx?ID=" + Server.UrlEncode(id));
        }

        protected void app_spec_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSpecialistsByName();
        }
    }
}