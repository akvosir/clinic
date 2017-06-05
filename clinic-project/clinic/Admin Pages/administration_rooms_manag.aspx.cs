using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class administration_rooms_manag : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bindRooms();
            }
        }

        protected void bindRooms()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT id_doctor, doctor_name, doctor_surname, doctor_fathersname, doctor_room FROM doctors"))
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
                                rooms_table.DataSource = ds;
                                rooms_table.DataBind();
                                rooms_table.UseAccessibleHeader = true;
                                rooms_table.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }
        }

        protected void rooms_table_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            rooms_table.PageIndex = e.NewPageIndex;
            bindRooms();
        }

        protected void rooms_table_RowEditing(object sender, GridViewEditEventArgs e)
        {
            rooms_table.EditIndex = e.NewEditIndex;
            bindRooms();
        }

        protected void rooms_table_RowUpdating(object sender, GridViewUpdateEventArgs e)
        { 
            Label id = rooms_table.Rows[e.RowIndex].FindControl("lbl_id") as Label;
            TextBox name = rooms_table.Rows[e.RowIndex].FindControl("txt_Room") as TextBox;
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("UPDATE doctors SET doctor_room =" + Convert.ToInt32(name.Text)+ " WHERE id_doctor = "  + Convert.ToInt32(id.Text)))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ShowNotification("Номер кабінету змінений!", WarningType.Success);
                    Response.AddHeader("REFRESH", "2; URL = administration_rooms_manag.aspx");
                }
            }
            rooms_table.EditIndex = -1; 
            bindRooms();
        }

        protected void rooms_table_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            rooms_table.EditIndex = -1;
            bindRooms();
        }
    }
}
