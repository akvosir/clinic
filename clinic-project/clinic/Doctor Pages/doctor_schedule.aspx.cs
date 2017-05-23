﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic.Doctor_Pages
{
    public partial class doctor_schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                d_schedule();
            }
        }

        protected void d_schedule()
        {
            //after login get doctor's id
            using (MySqlConnection con = new MySqlConnection(@"Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT patient_card.idpatient_card, patient_card.name, patient_card.surname, patient_card.fathers_name, start_app FROM `doctor_schedule` " +
                    "INNER JOIN patient_card ON patient = patient_card.idpatient_card WHERE doctor = 1"))
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
                                doc_schedule.UseAccessibleHeader = true;
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
    }
}