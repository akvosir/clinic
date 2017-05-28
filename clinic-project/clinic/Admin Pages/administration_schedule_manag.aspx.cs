using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Admin_Pages
{
    public partial class administration_schedule_manag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDoctors();
                bindDoctorSchedule();
            }
        }

        protected void bindDoctors()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = jnFq8Gk5Gk"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT doctors.id_doctor,  CONCAT_WS(' ', doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname) AS 'name' " +
                    "FROM `doctors`", con))
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
                                doctors.DataSource = ds;
                                doctors.DataBind();
                            }

                        }
                    }
                }
            }
        }
        protected void bindDoctorSchedule()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT day, start, end  FROM doctor_shift WHERE doctor_id =" + doctors.SelectedValue))
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
                                unbind.Visible = false;
                                schedule_table.DataSource = ds;
                                schedule_table.DataBind();
                            }
                            else
                            {
                                unbind.Visible = true;
                                schedule_table.DataSource = null;
                                schedule_table.DataBind();
                                day_add.Visible = true;
                                start_add.Visible = true;
                                end_add.Visible = true;
                                save_adding.Visible = true;
                            }

                        }
                    }
                }
            }
        }

        protected void schedule_table_RowEditing(object sender, GridViewEditEventArgs e)
        {
            schedule_table.EditIndex = e.NewEditIndex;
            bindDoctorSchedule();
        }

        protected void schedule_table_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox start = schedule_table.Rows[e.RowIndex].FindControl("txt_start") as TextBox;
            TextBox end = schedule_table.Rows[e.RowIndex].FindControl("txt_end") as TextBox;
            Label day = schedule_table.Rows[e.RowIndex].FindControl("lbl_day") as Label;
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                int result = DateTime.Parse(start.Text).ToLongTimeString().CompareTo(DateTime.Parse(end.Text).ToLongTimeString());
                if (result < 0)
                {
                    using (MySqlCommand cmd = new MySqlCommand("UPDATE doctor_shift SET start = '" + DateTime.Parse(start.Text).ToString("HH:mm:ss") + "', end = '" + DateTime.Parse(end.Text).ToString("HH:mm:ss") +
                    "' WHERE doctor_id = " + doctors.SelectedValue + " AND day = '" + day.Text + "'"))
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    schedule_table.EditIndex = -1;
                    bindDoctorSchedule();
                }
                else if (result == 0)
                    Response.End();
                else
                    Response.End();
            }
        }


        protected void schedule_table_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            schedule_table.EditIndex = -1;
            bindDoctorSchedule();
        }
        protected void doctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindDoctorSchedule();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }
    }
}
