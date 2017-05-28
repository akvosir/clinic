using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            doc_dropdown();
        }

        protected void doc_dropdown()
        {
            //after login get doctor's id
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT CONCAT_WS(' ', doctor_surname, doctor_name, doctor_fathersname) AS 'name', id_doctor FROM doctors"))
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
                                doc.DataSource = ds;
                                doc.DataBind();
                            }

                        }
                    }
                }
            }
        }

            protected void d_schedule()
        {
            //after login get doctor's id
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT start_app, name, patient_card.surname, patient_card.fathers_name, doctors.doctor_surname " +
                    "FROM `doctor_schedule` INNER JOIN patient_card ON patient_card.idpatient_card = patient " +
                    "INNER JOIN doctors on doctors.id_doctor = doctor WHERE date(start_app) = '" + (DateTime.Parse(dateTB.Text).ToString("yyyy-MM-dd")) + "' AND doctor = " + doc.SelectedValue))
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
                                GridView1.DataSource = ds;
                                GridView1.DataBind();
                                GridView1.UseAccessibleHeader = true;
                            }

                        }
                    }
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            d_schedule();
        }

        protected void card_Click_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }
    }
}
