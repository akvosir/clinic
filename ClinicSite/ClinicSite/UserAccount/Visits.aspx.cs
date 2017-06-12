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
    public partial class Visits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                visitsTable();
                HttpContext context = HttpContext.Current;
                if (context.Session["telephone"] != null)
                {
                    UserName.Text = Session["UserName"].ToString();
                }
                //string id = Request.QueryString["ID"];
                //DateTime date = DateTime.Parse(Request.QueryString["date"]);

                //visit_results(Int32.Parse(id), date.Date.ToString("yyy-MM-dd"));
                //medicine_table(Int32.Parse(id), date.Date.ToString("yyy-MM-dd"));
            }
        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = localhost; Database = clinic_bd; Uid = root; Password = '12345'; CharSet = utf8");
            //MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }

        protected void visitsTable()
        {
            HttpContext context = HttpContext.Current;
            if (context.Session["id"] != null)
            {
                using (MySqlConnection con = Connection())
                {

                    using (MySqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname, visits.visit_date FROM doctors " +
                         "INNER JOIN visits ON visits.doctor_id = doctors.id_doctor WHERE visits.patient_id = " + Session["id"];
                    
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable ds = new DataTable())
                            {
                                sda.Fill(ds);
                                if (ds.Rows.Count > 0)
                                {
                                    visit_table.DataSource = ds;
                                    visit_table.DataBind();
                                    visit_table.UseAccessibleHeader = true;
                                }

                            }
                        }
                    }
                }
            }
        }
        protected void visitClick_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Session["date"] = clickedRow.Cells[0].Text;
            Response.Redirect("reception_saved_results.aspx?");

        }

        // protected void visit_results(int id, String date)
        //{
        //    using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
        //    {

        //        using (MySqlCommand cmd = new MySqlCommand("SELECT visit_date, reason, symptoms, diagnosis, " +
        //            "recom_consult, recom_analysis, next_visit, patient_card.name, patient_card.surname, patient_card.fathers_name " +
        //            "FROM visits INNER JOIN patient_card ON visits.patient_id = patient_card.idpatient_card WHERE patient_id =" + id + " AND visit_date = '" + date + "'"))
        //        {
        //            using (MySqlDataAdapter sda = new MySqlDataAdapter())
        //            {
        //                cmd.Connection = con;
        //                sda.SelectCommand = cmd;
        //                con.Open();
        //                MySqlDataReader reader = cmd.ExecuteReader();
        //                while (reader.Read())
        //                {
        //                    dsr_visit_date.Text = "Дата візиту " + reader.GetDateTime(0).Date.ToString("dd.MM.yyy");
        //                    dsr_reason.Text = reader.GetString(1);
        //                    dsr_symptoms.Text = reader.GetString(2);
        //                    dsr_diagnosis.Text = reader.GetString(3);
        //                    dsr_consult.Text = reader.GetString(4);
        //                    dsr_analysis.Text = reader.GetString(5);
        //                    dsr_next_date.Text = reader.GetDateTime(6).ToString("dd.MM.yyy");
        //                    dsr_name.Text = reader.GetString(8) + " " + reader.GetString(7) + " " + reader.GetString(9);

        //                }
        //                con.Close();
        //            }
        //        }
        //    }
        //
        //}

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["telephone"] = null;
            Session["date"] = null;
            Session["UserName"] = null;
            Response.Redirect("../MainSite/LogIn.aspx");
        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Response.Redirect("chooseDoctor.aspx?");
        }

        protected void visits_Click(object sender, EventArgs e)
        {            
            Response.Redirect("Visits.aspx?");
        }
    }
}