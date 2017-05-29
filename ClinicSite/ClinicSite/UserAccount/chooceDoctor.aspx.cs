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
    public partial class chooceDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSpecialistsByName();
            }

            HttpContext context = HttpContext.Current;
            if (context.Session["UserName"] != null)
            {
                string un = (string)(Session["UserName"]);
                UserName.Text = un;
            }

        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }

        protected void bindSpecialistsByName()
        {
            using (MySqlConnection con = Connection())
            {
                using (MySqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT  id_doctor, CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name'" +
                        "FROM doctors WHERE doctor_specialty ='1'";

                    //"SELECT  id_doctor, CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name'" +
                    //    "FROM doctors INNER JOIN doctor_specialty ON doctor_specialty = doctor_specialty.id_specialty" +
                    //    "WHERE name_specialty ='Терапевт'";
                    /*CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name',  WHERE doctor_specialty ='Терапевт'*/

                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable ds = new DataTable())
                        {
                            sda.Fill(ds);
                            therapeutist.DataSource = ds;
                            therapeutist.DataBind();

                        }
                    }
                }
            }
        }

        
        protected void make_app_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_schedule (start_app, end_app, doctor, patient) VALUES (@start_app, @end_app, @doctor, @patient)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        DateTime d = DateTime.Parse(app_spec_date.Text).Add(TimeSpan.Parse(app_spec_time.Text));
                        DateTime ed = d.AddMinutes(30.0);

                        cmd.Parameters.AddWithValue("@start_app", d);
                        cmd.Parameters.AddWithValue("@end_app", ed);
                        cmd.Parameters.AddWithValue("@doctor", 2);
                        cmd.Parameters.AddWithValue("@patient", 1);

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Response.Redirect("chooceDoctor.aspx?");
        }

        protected void visits_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("receptionResult.aspx?ID=" + Server.UrlEncode(id));
        }

        protected void app_spec_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSpecialistsByName();
        }
    }
}