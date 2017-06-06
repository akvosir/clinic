using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            DateTime date = DateTime.Parse(Request.QueryString["date"]);
            String formatForMySql = date.Date.ToString("yyy-MM-dd");

            visit_results(Int32.Parse(id), formatForMySql);
            medicine_table(Int32.Parse(id), formatForMySql);
        }

        protected void medicine_table(int id, String date)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT start_med, end_med, howtotake, medicine.medicine_name FROM medicine_patient " +
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
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT visit_date, reason, symptoms, diagnosis, " +
                    "doctor_specialty.name_specialty, recom_analysis, next_visit, patient_card.name, patient_card.surname, patient_card.fathers_name " +
                    "FROM visits INNER JOIN doctor_specialty on visits.recom_consult = id_specialty INNER JOIN patient_card ON visits.patient_id = patient_card.idpatient_card WHERE patient_id =" + id + " AND visit_date = '" + date + "'"))
                {
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
    }
}