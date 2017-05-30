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
    public partial class receptionResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["ID"];
                DateTime date = DateTime.Parse(Request.QueryString["date"]);

                visit_results(Int32.Parse(id), date.Date.ToString("yyy-MM-dd"));
                medicine_table(Int32.Parse(id), date.Date.ToString("yyy-MM-dd"));
            }
        }

        protected void medicine_table(int id, String date)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT start_med, end_med, medicine.medicine_name FROM medicine_patient " +
                    "INNER JOIN medicine ON medicine_patient.id_medicine = medicine.id_medicine INNER JOIN visits ON medicine_patient.id_visit = visits.id_visit " +
                    "WHERE visits.visit_date = '" + date + "' AND visits.patient_id = " + id))
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
                                dsr_med_table.DataSource = ds;
                                dsr_med_table.DataBind();
                                dsr_med_table.UseAccessibleHeader = true;
                                dsr_med_table.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }

        }

        protected void visit_results(int id, String date)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT visit_date, reason, symptoms, diagnosis, " +
                    "recom_consult, recom_analysis, next_visit, patient_card.name, patient_card.surname, patient_card.fathers_name " +
                    "FROM visits INNER JOIN patient_card ON visits.patient_id = patient_card.idpatient_card WHERE patient_id =" + id + " AND visit_date = '" + date + "'"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            dsr_visit_date.Text = "Дата візиту " + reader.GetDateTime(0).Date.ToString("dd.MM.yyy");
                            dsr_reason.Text = reader.GetString(1);
                            dsr_symptoms.Text = reader.GetString(2);
                            dsr_diagnosis.Text = reader.GetString(3);
                            dsr_consult.Text = reader.GetString(4);
                            dsr_analysis.Text = reader.GetString(5);
                            dsr_next_date.Text = reader.GetDateTime(6).ToString("dd.MM.yyy");
                            dsr_name.Text = reader.GetString(8) + " " + reader.GetString(7) + " " + reader.GetString(9);

                        }
                        con.Close();
                    }
                }
            }
        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Response.Redirect("chooseDoctor.aspx?");
        }

        protected void visits_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("receptionResult.aspx?ID=" + Server.UrlEncode(id));
        }
    }
}