using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic.Admin_Pages
{
    public partial class administrator_password_manag : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindStaff();
            }
        }

        protected void bindStaff()
        {
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM staff_login "))
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
                                user_table.DataSource = ds;
                                user_table.DataBind();
                                user_table.UseAccessibleHeader = true;
                                user_table.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }
        }

        protected void findStaff()
        {
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT id, name, surname, fathers_name, login, type FROM staff_login" ))
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
                                user_table.DataSource = ds;
                                user_table.DataBind();
                                user_table.UseAccessibleHeader = true;
                                user_table.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }
        }

        protected void user_table_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            user_table.PageIndex = e.NewPageIndex;
            bindStaff();
        }

        protected void user_table_RowEditing(object sender, GridViewEditEventArgs e)
        {
            user_table.EditIndex = e.NewEditIndex;
            bindStaff();
        }

        protected void user_table_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = user_table.Rows[e.RowIndex].FindControl("lbl_id") as Label;
            TextBox surname = user_table.Rows[e.RowIndex].FindControl("admch_surname") as TextBox;
            TextBox name = user_table.Rows[e.RowIndex].FindControl("admch_name") as TextBox;
            TextBox fathers_name = user_table.Rows[e.RowIndex].FindControl("admch_fname") as TextBox;
            TextBox login = user_table.Rows[e.RowIndex].FindControl("admch_login") as TextBox;
            TextBox password = user_table.Rows[e.RowIndex].FindControl("admch_password") as TextBox;

            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("UPDATE staff_login SET surname= @surname, name =@name, fathers_name = @fathers_name, " +
                    "login=@login, password = @password WHERE id = " + Convert.ToInt32(id.Text)))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@surname", surname.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@fathers_name", fathers_name.Text);
                    cmd.Parameters.AddWithValue("@login", login.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ShowNotification("Дані збережені!", WarningType.Success);
                    Response.AddHeader("REFRESH", "2; URL = administrator_password_manag.aspx");
                }
            }
            user_table.EditIndex = -1;
            bindStaff();
        }

        protected void user_table_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = user_table.Rows[e.RowIndex].FindControl("lbl_id") as Label;
            using (MySqlConnection con = new MySqlConnection("Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("DELETE FROM staff_login WHERE id =" + Convert.ToInt32(id.Text)))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ShowNotification("Працівника видалено!", WarningType.Success);
                    Response.AddHeader("REFRESH", "2; URL = administrator_password_manag.aspx");
                }
            }
            this.bindStaff();
        }

        protected void user_table_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            user_table.EditIndex = -1;
            bindStaff();
        }
    }

}