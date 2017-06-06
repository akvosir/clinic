using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class WebForm3 : BootstrapPage
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
                                novis.Visible = false;
                                GridView1.DataSource = ds;
                                GridView1.DataBind();
                                GridView1.UseAccessibleHeader = true;
                            }
                            else
                            {
                                novis.Visible = true;
                            }

                        }
                    }
                }
            }
        }

        protected void pat_schedule()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
                                novis.Visible = false;
                                GridView2.DataSource = ds;
                                GridView2.DataBind();
                                GridView2.UseAccessibleHeader = true;
                            }
                            else
                            {
                                novis.Visible = true;
                            }

                        }
                    }
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            d_schedule();
            make_anapp.Visible = true;
            Session["schedule_date"] = dateTB.Text;
            Session["schedule_doc_id"] = doc.SelectedValue;
        }

        protected void cancel_doc_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM doctor_schedule WHERE id_app =" + id))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    ShowNotification("Прийом скасовано!", WarningType.Success);

                    System.Threading.Thread.Sleep(2000);
                    Response.Redirect(Request.RawUrl);
                }
            }

            d_schedule();

        }

        protected void rec_pd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rec_pd.SelectedValue == "1"){
                GridView1.DataSource = null;
                GridView1.DataBind();
                doc.Visible = false;
                submit.Visible = false;

                dateTB.Visible = true;
                pat.Visible = true;
                pat_dropdown();
                submit_pat.Visible = true;
            }
            else if(rec_pd.SelectedValue == "2"){
                GridView2.DataSource = null;
                GridView2.DataBind();
                pat.Visible = false;
                submit_pat.Visible = false;

                dateTB.Visible = true;
                doc.Visible = true;
                doc_dropdown();
                submit.Visible = true;
                doc_rfv.Display = ValidatorDisplay.Dynamic;
            }
        }

        protected void cancel_pat_Click(object sender, EventArgs e)
        {
            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int id = Convert.ToInt32(GridView2.DataKeys[rowIndex].Values[0]);
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
            make_anapp.Visible = true;
            Session["schedule_pat"] = pat.SelectedValue;
            Session["schedule_date"] = dateTB.Text;
        }

        protected void make_anapp_Click(object sender, EventArgs e)
        {
            Session["page"] = "schedule";
            Response.Redirect("reception_app.aspx");
        }
    }
}
