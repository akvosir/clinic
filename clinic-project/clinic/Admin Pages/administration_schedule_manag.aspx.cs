using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Admin_Pages
{
    public partial class administration_schedule_manag : BootstrapPage
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

                using (MySqlCommand cmd = new MySqlCommand("SELECT shift, start, end, even_odd  FROM doctor_shift WHERE doctor_id =" + doctors.SelectedValue))
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
                                lbl1.Visible = false;
                                lbl2.Visible = false;
                                lbl3.Visible = false;
                                lbl4.Visible = false;
                                ddeo_1.Visible = false;
                                ddeo_2.Visible = false;
                                ddsh_1.Visible = false;
                                start_add1.Visible = false;
                                end_add1.Visible = false;
                                ddsh_2.Visible = false;
                                start_add2.Visible = false;
                                end_add2.Visible = false;
                                save_adding.Visible = false;
                                unbind.Visible = false;
                                schedule_table.DataSource = ds;
                                schedule_table.DataBind();
                            }
                            else
                            {
                                lbl1.Visible = true;
                                lbl3.Visible = true;
                                lbl2.Visible = true;
                                lbl4.Visible = true;
                                unbind.Visible = true;
                                schedule_table.DataSource = null;
                                schedule_table.DataBind();
                                ddsh_2.Visible = true;
                                start_add2.Visible = true;
                                end_add2.Visible = true;
                                ddsh_1.Visible = true;
                                start_add1.Visible = true;
                                end_add1.Visible = true;
                                ddeo_1.Visible = true;
                                ddeo_2.Visible = true;
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

        //ЕСЛИ НАЖАТЬ ВО ВТОРОЙ РАЗ НИЧЕГО НЕ БАЙНДИТСЯ
        protected void schedule_table_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox start = schedule_table.Rows[e.RowIndex].FindControl("txt_start") as TextBox;
            TextBox end = schedule_table.Rows[e.RowIndex].FindControl("txt_end") as TextBox;
            DropDownList shift = schedule_table.Rows[e.RowIndex].FindControl("dd_shift") as DropDownList;
            Label day = schedule_table.Rows[e.RowIndex].FindControl("lbl_day") as Label;

            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                TimeSpan time = TimeSpan.Parse(end.Text).Subtract(TimeSpan.Parse(start.Text));

                using (MySqlCommand cmd = new MySqlCommand("UPDATE doctor_shift SET shift = @shift, start = @start, end = @end WHERE doctor_id = " + doctors.SelectedValue +
                " AND even_odd = " + Int32.Parse(day.Text)))
                {
                    try
                    {
                        if (time > new TimeSpan(3, 0, 0))
                        {
                            cmd.Connection = con;
                            con.Open();
                            cmd.Parameters.AddWithValue("@shift", shift.SelectedValue);
                            cmd.Parameters.AddWithValue("@start", TimeSpan.Parse(start.Text));
                            cmd.Parameters.AddWithValue("@end", TimeSpan.Parse(end.Text));
                            cmd.ExecuteNonQuery();
                            con.Close();
                            ShowNotification("Час роботи змінений!", WarningType.Success);
                            Response.AddHeader("REFRESH", "2; URL = administration_schedule_manag.aspx");
                        }
                        else
                        {
                            ShowNotification("Початок зміни повинен бути раніше, ніж кінець, хоча б на три години!", WarningType.Danger);
                            Response.AddHeader("REFRESH", "2; URL = administration_schedule_manag.aspx");
                        }
                    }
                    catch (Exception ex)
                    {
                        ShowNotification("Зверніться за допомогою до адміністратора!", WarningType.Danger);
                        throw ex;
                    }

                    schedule_table.EditIndex = -1;
                    bindDoctorSchedule();
                }
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

        protected void save_adding_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO doctor_shift (even_odd, shift, start, end, doctor_id) VALUES (@even_odd1, @shift1, @start1, @end1, @doctor_id1), (@even_odd2, @shift2, @start2, @end2, @doctor_id2)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            cmd.Connection = con;
                            con.Open();
                            cmd.Parameters.AddWithValue("@even_odd1", ddeo_1.SelectedValue);
                            cmd.Parameters.AddWithValue("@even_odd2", ddeo_2.SelectedValue);
                            cmd.Parameters.AddWithValue("@shift1", Int32.Parse(ddsh_1.Text));
                            cmd.Parameters.AddWithValue("@start1", DateTime.Parse(start_add1.Text).ToString("HH:mm:ss"));
                            cmd.Parameters.AddWithValue("@end1", DateTime.Parse(end_add1.Text).ToString("HH:mm:ss"));
                            cmd.Parameters.AddWithValue("@doctor_id1", doctors.SelectedValue);
                            cmd.Parameters.AddWithValue("@shift2", Int32.Parse(ddsh_2.Text));
                            cmd.Parameters.AddWithValue("@start2", DateTime.Parse(start_add2.Text).ToString("HH:mm:ss"));
                            cmd.Parameters.AddWithValue("@end2", DateTime.Parse(end_add2.Text).ToString("HH:mm:ss"));
                            cmd.Parameters.AddWithValue("@doctor_id2", doctors.SelectedValue);
                            cmd.ExecuteNonQuery();

                            cmd.Dispose();
                            con.Close();
                            ShowNotification("Графік роботи збережений!", WarningType.Success);
                        }
                        catch (Exception ex) {
                            ShowNotification("Зверніться за допомогою до адміністратора!", WarningType.Danger);
                            throw ex;
                        }
                    }
                }
            }
                bindDoctorSchedule();
        }

    }
}
