using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_card_ind1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["ID"];
                patientInfo(Int32.Parse(id));
                visits(Int32.Parse(id));
            }


        }
        protected void patientInfo(int id) {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient WHERE idpatient_card = " + id))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            dci_id.Text = reader.GetInt32(0).ToString();
                            dci_name.Text = reader.GetString(1) + " " + reader.GetString(2) + " " + reader.GetString(3);
                            dci_birthday.Text = reader.GetDateTime(4).ToString("dd MMMM yyyy");
                            dci_gender.Text = reader.GetString(5);
                            dci_email.Text = reader.GetString(6);
                            dci_address.Text = reader.GetString(7);
                            dci_city.Text = reader.GetString(8);
                            dci_zip.Text = reader.GetInt32(9).ToString();
                            dci_phone.Text = reader.GetString(10);
                        }

                        con.Close();
                    }
                }
            }
        }

        protected void visits(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname, visits.visit_date FROM doctors " +
                    "INNER JOIN visits ON visits.doctor_id = doctors.id_doctor WHERE visits.patient_id = " + id))
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
                                visit_table_doc.DataSource = ds;
                                visit_table_doc.DataBind();
                                visit_table_doc.UseAccessibleHeader = true;
                            }

                        }
                    }
                }
            }

        }

        protected void visitClick_doc_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Response.Redirect(String.Format("doctor_saved_results.aspx?ID={0}&date={1}", Server.UrlEncode(dci_id.Text), Server.UrlEncode(clickedRow.Cells[0].Text)));
        }
    }
}