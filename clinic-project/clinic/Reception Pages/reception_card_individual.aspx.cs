using System;
using System.Collections;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class reception_card_individual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            fillTextBoxes(Int32.Parse(id));
            visits(Int32.Parse(id));
        }

        protected void visits(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT doctors.doctor_surname, doctors.doctor_name, doctors.doctor_fathersname, visits.visit_date FROM doctors " +
                    "INNER JOIN visits ON visits.doctor_id = doctors.id_doctor WHERE visits.patient_id = " + id))
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
                                visit_table.DataSource = ds;
                                visit_table.DataBind();
                                visit_table.UseAccessibleHeader = true;
                            }

                        }
                    }
                }
            }

        }

       protected void findPatient(Int32 id, Hashtable hash, Card c)
        {
            if (hash.ContainsKey(id))
            {
                c = (Card)hash[id];
                rci_id.Text = id.ToString();
            }

        }

        protected void visitClick_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Response.Redirect(String.Format("reception_saved_results.aspx?ID={0}&date={1}", Server.UrlEncode(rci_id.Text), Server.UrlEncode(clickedRow.Cells[0].Text)));

        }

        protected void rci_edit_Click(object sender, EventArgs e)
        {
            rci_editname.Visible = true;
            rci_surname.Visible = true;
            rci_fathers.Visible = true;
            rci_save.Visible = true;

            rci_birthday.ReadOnly = false;
            rci_gender.ReadOnly = false;
            rci_email.ReadOnly = false;
            rci_address.ReadOnly = false;
            rci_phonenumber.ReadOnly = false;
            rci_city.ReadOnly = false;
            rci_zip.ReadOnly = false;
            rci_phonenumber.ReadOnly = false;
        }

        protected void fillTextBoxes(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient WHERE idpatient_card = " + id))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            rci_id.Text = reader.GetInt32(0).ToString();
                            rci_surname.Text = reader.GetString(1);
                            rci_name.Text = reader.GetString(2);
                            rci_fathers.Text = reader.GetString(3);
                            rci_birthday.Text = reader.GetDateTime(4).ToString();
                            rci_gender.Text = reader.GetString(5);
                            rci_email.Text = reader.GetString(6);
                            rci_address.Text = reader.GetString(7);
                            rci_address.Text = reader.GetString(8);
                            rci_zip.Text = reader.GetInt32(9).ToString();
                            rci_phonenumber.Text = reader.GetString(10);


                        }

                        con.Close();
                    }
                }
            }
        }

        protected void rci_save_Click(object sender, EventArgs e)
        {
            updateDB();
        }



        protected void updateDB()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("UPDATE patient_card SET surname = @surname, name = @name, fathers_name = @fathers_name,  " +
                    "gender = @gender, email = @email, address = @address, city = @city, zip_code = @zip_code WHERE idpatient_card = " + Int32.Parse(rci_id.Text)))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Parameters.AddWithValue("@surname", rci_surname.Text);
                        cmd.Parameters.AddWithValue("@name", rci_editname.Text);
                        cmd.Parameters.AddWithValue("@fathers_name", rci_fathers.Text);
                        //cmd.Parameters.AddWithValue("@birthday", rci_birthday.Text); //date
                        cmd.Parameters.AddWithValue("@gender", rci_gender.Text);
                        cmd.Parameters.AddWithValue("@email", rci_email.Text);
                        cmd.Parameters.AddWithValue("@address", rci_address.Text);
                        cmd.Parameters.AddWithValue("@city", rci_city.Text);
                        cmd.Parameters.AddWithValue("@zip_code", rci_zip.Text); //int

                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();


                    }
                }
            }
        }

    }
}


