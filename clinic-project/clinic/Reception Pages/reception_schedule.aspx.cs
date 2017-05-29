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
            if (!IsPostBack) {
                dateTB.Visible = true;
                pat.Visible = true;
                pat_dropdown();
                submit_pat.Visible = true;
            }
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

        protected void pat_dropdown()
        {
            //after login get doctor's id
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT CONCAT_WS(' ', surname, name, fathers_name) AS 'name', idpatient_card FROM patient_card"))
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
                                pat.DataSource = ds;
                                pat.DataBind();
                            }

                        }
                    }
                }
            }
        }

        protected void d_schedule()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id_app, start_app, patient_card.name, patient_card.surname, patient_card.fathers_name " +
                    "FROM `doctor_schedule` INNER JOIN patient_card ON patient_card.idpatient_card = patient " +
                    "WHERE date(start_app) = '" + (DateTime.Parse(dateTB.Text).ToString("yyyy-MM-dd")) + "' AND doctor = " + doc.SelectedValue))
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

        protected void pat_schedule()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id_app, start_app, doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname " +
                    "FROM `doctor_schedule` INNER JOIN doctors ON doctors.id_doctor = doctor " +
                    "WHERE date(start_app) = '" + (DateTime.Parse(dateTB.Text).ToString("yyyy-MM-dd")) + "' AND patient = " + pat.SelectedValue))
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
                                GridView2.DataSource = ds;
                                GridView2.DataBind();
                                GridView2.UseAccessibleHeader = true;
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

        protected void cancel_doc_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM doctor_schedule WHERE id_app =" + id))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
            }

            d_schedule();

        }

        protected void rec_pd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rec_pd.SelectedValue == "1"){
                GridView1.DataSource = null;
                GridView1.DataBind();
                ch_date.Visible = true;
                ch_pat.Visible = true;
                doc.Visible = false;
                submit.Visible = false;

                ch_doc.Visible = false;
                dateTB.Visible = true;
                pat.Visible = true;
                pat_dropdown();
                submit_pat.Visible = true;
            }
            else if(rec_pd.SelectedValue == "2"){
                GridView2.DataSource = null;
                GridView2.DataBind();
                ch_date.Visible = true;
                ch_pat.Visible = false;
                pat.Visible = false;
                submit_pat.Visible = false;

                ch_doc.Visible = true;
                dateTB.Visible = true;
                doc.Visible = true;
                doc_dropdown();
                submit.Visible = true;
            }
        }

        protected void cancel_pat_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int id = Convert.ToInt32(GridView2.DataKeys[rowIndex].Values[0]);
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM doctor_schedule WHERE id_app =" + id))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView2.DataSource = null;
                    GridView2.DataBind();
                }

                pat_schedule();
            }

        }

        protected void submit_pat_Click(object sender, EventArgs e)
        {
            pat_schedule();
        }

        protected void make_anapp_Click(object sender, EventArgs e)
        {

        }
    }
}
