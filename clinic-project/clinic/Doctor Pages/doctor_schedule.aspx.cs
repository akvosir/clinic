using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_schedule : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    d_schedule(DateTime.Now.Date);
                 
            }
        }

        protected void d_schedule(DateTime date)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT patient_card.idpatient_card, patient_card.name, patient_card.surname, patient_card.fathers_name, start_app FROM doctor_schedule " +
                    "INNER JOIN patient_card ON patient = patient_card.idpatient_card WHERE doctor = " + UserS.id + " AND date(start_app) = '" + date.ToString("yyyy-MM-dd") + "'"))
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
                                doc_schedule.DataSource = ds;
                                doc_schedule.DataBind();
                            }

                        }
                    }
                }
            }

        }

        protected void start_app_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Response.Redirect("doctor_card.aspx?ID=" + Server.UrlEncode(clickedRow.Cells[0].Text));
        }

        protected void patient_card_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Response.Redirect("doctor_card_ind.aspx?ID=" + Server.UrlEncode(clickedRow.Cells[0].Text));
        }
        protected void date_bar_TextChanged(object sender, EventArgs e)
        {
                d_schedule(DateTime.Parse(date_bar.Text));
        }

    }
}