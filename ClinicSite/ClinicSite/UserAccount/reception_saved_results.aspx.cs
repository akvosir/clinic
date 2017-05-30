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
    public partial class reception_saved_results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            HttpContext context = HttpContext.Current;
            if (context.Session["telephone"] != null)
            {
                UserName.Text = Session["UserName"].ToString();
                var id = Int32.Parse(Session["id"].ToString());
                string dt = Session["date"].ToString();
                                
                String formatForMySql = DateTime.ParseExact(dt, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture).Date.ToString("yyy-MM-dd");
                //DateTime date = DateTime.Parse(dt);
                //String formatForMySql = date.Date.ToString("yyy-MM-dd");

                visit_results(id, formatForMySql);
                medicine_table(id, formatForMySql);
            }
        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }

        protected void medicine_table(int id, String date)
        {
            using (MySqlConnection con = Connection())
            {

                using (MySqlCommand cmd = con.CreateCommand()) 
                {
                    cmd.CommandText = "SELECT start_med, end_med, howtotake, medicine.medicine_name FROM medicine_patient " +
                     "INNER JOIN medicine ON medicine_patient.id_medicine = medicine.id_medicine INNER JOIN visits ON medicine_patient.id_visit = visits.id_visit " +
                     "WHERE visits.visit_date = '" + date + "' AND visits.patient_id = " + id;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable ds = new DataTable())
                        {
                            sda.Fill(ds);
                            if (ds.Rows.Count > 0)
                            {
                                rsr_med_table.DataSource = ds;
                                rsr_med_table.DataBind();
                                rsr_med_table.UseAccessibleHeader = true;
                                rsr_med_table.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }

        }

        protected void visit_results(int id, String date)
        {
            using (MySqlConnection con = Connection())
            {

                using (MySqlCommand cmd = con.CreateCommand()) 
                {
                    cmd.CommandText = "SELECT visit_date, reason, symptoms, diagnosis, " +
                     "doctor_specialty.name_specialty, recom_analysis, next_visit, patient_card.name, patient_card.surname, patient_card.fathers_name " +
                     "FROM visits INNER JOIN doctor_specialty on visits.recom_consult = id_specialty INNER JOIN patient_card ON " +
                     "patient_id = patient_card.idpatient_card WHERE patient_id =" + id + " AND visit_date = '" + date + "'";
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            rsr_visit_date.Text = "Дата візиту " + reader.GetDateTime(0).Date.ToString("dd MMMM yyy");
                            rsr_reason.Text = reader.GetString(1);
                            rsr_symptoms.Text = reader.GetString(2);
                            rsr_diagnosis.Text = reader.GetString(3);
                            rsr_consult.Text = reader.GetString(4);
                            rsr_analysis.Text = reader.GetString(5);
                            rsr_next_date.Text = reader.GetDateTime(6).ToString("dd-MM-yyyy");
                            rsr_name.Text = reader.GetString(8) + " " + reader.GetString(7) + " " + reader.GetString(9);

                        }
                        con.Close();
                    }
                }
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Site.aspx");
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