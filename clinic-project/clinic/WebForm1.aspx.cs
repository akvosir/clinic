using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using Telerik.Web.UI;
using System.Text;

namespace clinic
{
    public partial class WebForm1 : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindMedicine(medicine);
                bindMedicine(medicine1);
                bindMedicine(medicine2);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(med_take.Text)) {
                addMedicine(medicine, med_take, med_st, med_en);
            }
            if (!string.IsNullOrEmpty(med_take1.Text))
            {
                addMedicine(medicine1, med_take1, med_st1, med_en1);
            }
            if (!string.IsNullOrEmpty(med_take2.Text))
            {
                addMedicine(medicine2, med_take2, med_st2, med_en2);
            }

        }
        protected void addMedicine(DropDownList drop, TextBox t1, TextBox t2, TextBox t3)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root"))
            {
                using (MySqlCommand cmd = new MySqlCommand("INSERT INTO medicine_patient (id_medicine, id_visit, start_med, end_med, howtotake) " +
                    "VALUES (@id_medicine, @id_visit, @start_med, @end_med, @howtotake)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.Parameters.AddWithValue("@id_medicine", drop.SelectedValue);
                        cmd.Parameters.AddWithValue("@id_visit", 27);
                        cmd.Parameters.AddWithValue("@start_med", DateTime.Parse(t2.Text));
                        cmd.Parameters.AddWithValue("@end_med", DateTime.Parse(t3.Text));
                        cmd.Parameters.AddWithValue("@howtotake", t1.Text);

                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
            }
        }

        protected void bindMedicine(DropDownList table)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT medicine_name, id_medicine FROM medicine"))
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
                                table.DataSource = ds;
                                table.DataBind();

                            }

                        }
                    }
                }
            }
        }

    }

}