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
            if (!IsPostBack) {

                if (Session["page"].ToString().Equals("cards")) {
                    string id = Request.QueryString["ID"];
                    fillTextBoxes(Int32.Parse(id));
                    visits(Int32.Parse(id)); 

                }
                else {
                    generalInfo();
                }
            }

        }

        protected void visits(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
                                lbl_vis.Visible = false;
                                visit_table.DataSource = ds;
                                visit_table.DataBind();
                            }
                            else {
                                lbl_vis.Visible = true;
                            }

                        }
                    }
                }
            }

        }

        protected void generalInfo()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                MySqlCommand command = new MySqlCommand("SELECT idpatient_card from patient_card order by idpatient_card DESC LIMIT 1");
                command.Connection = con;
                con.Open();
                int id = Int32.Parse(command.ExecuteScalar().ToString());

                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient " +
                    "WHERE idpatient_card = " + id)) 
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            rci_id.Text = reader.GetInt32(0).ToString();
                            rci_surname.Text = reader.GetString(1);
                            rci_name.Text = reader.GetString(1) + " " + reader.GetString(2) + " " + reader.GetString(3);
                            rci_editname.Text = reader.GetString(2);
                            rci_fathers.Text = reader.GetString(3);
                            rci_birthday.Text = reader.GetDateTime(4).ToString();
                            ddlGender.SelectedValue = reader.GetString(5);
                            rci_email.Text = reader.GetString(6);
                            rci_address.Text = reader.GetString(7);
                            rci_cit.SelectedValue = reader.GetString(8);
                            rci_zip.Text = reader.GetInt32(9).ToString();
                            rci_phonenumber.Text = reader.GetString(10);
                        }
                        con.Close();
                    }
                }
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
            rci_cancel.Visible = true;
            rci_fathnameLab.Visible = true;
            rci_nameLab.Visible = true;
            rci_surnameLab.Visible = true;
            rci_name.Visible = false;

            rci_birthday.ReadOnly = false;
            ddlGender.Enabled = true;
            rci_email.ReadOnly = false;
            rci_address.ReadOnly = false;
            rci_phonenumber.ReadOnly = false;
            rci_cit.Enabled = true;
            rci_zip.ReadOnly = false;
            rci_phonenumber.ReadOnly = false;
        }

        protected void fillTextBoxes(int id)
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
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
                            rci_name.Text = reader.GetString(1) + " " + reader.GetString(2) + " " + reader.GetString(3);
                            rci_editname.Text = reader.GetString(2);
                            rci_surname.Text = reader.GetString(1);
                            rci_fathers.Text = reader.GetString(3);
                            rci_birthday.Text = reader.GetDateTime(4).Date.ToString("yyyy-MM-dd");
                            ddlGender.SelectedValue = reader.GetString(5);
                            rci_email.Text = reader.GetString(6);
                            rci_address.Text = reader.GetString(7);
                            rci_cit.SelectedValue = reader.GetString(8);
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
            fillTextBoxes(Convert.ToInt32(Request.QueryString["ID"]));
            rci_editname.Visible = false;
            rci_surname.Visible = false;
            rci_fathers.Visible = false;
            rci_save.Visible = false;
            rci_cancel.Visible = false;
            rci_fathnameLab.Visible = false;
            rci_nameLab.Visible = false;
            rci_surnameLab.Visible = false;
            rci_name.Visible = true;

            rci_birthday.ReadOnly = true;
            ddlGender.Enabled = false;
            rci_email.ReadOnly = true;
            rci_address.ReadOnly = true;
            rci_phonenumber.ReadOnly = true;
            rci_cit.Enabled = false;
            rci_zip.ReadOnly = true;
            rci_phonenumber.ReadOnly = true;
            

        }

        protected void updateDB()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand cmd = new MySqlCommand("UPDATE patient_card SET surname = @surname, name = @name, fathers_name = @fathers_name,  " +
                    "gender = @gender, email = @email, address = @address, city = @city, zip_code = @zip_code WHERE idpatient_card = " + Int32.Parse(rci_id.Text)))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        try
                        {
                            cmd.Parameters.AddWithValue("@surname", rci_surname.Text);
                            cmd.Parameters.AddWithValue("@name", rci_editname.Text);
                            cmd.Parameters.AddWithValue("@fathers_name", rci_fathers.Text);
                            cmd.Parameters.AddWithValue("@birthday", DateTime.Parse(rci_birthday.Text).Date);
                            cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                            cmd.Parameters.AddWithValue("@email", rci_email.Text);
                            cmd.Parameters.AddWithValue("@address", rci_address.Text);
                            cmd.Parameters.AddWithValue("@city", rci_cit.SelectedValue);
                            cmd.Parameters.AddWithValue("@zip_code", Int32.Parse(rci_zip.Text)); 

                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        catch(Exception ex) {
                            throw ex;
                        }

                    }
                }
            }
        }

        protected void rci_app_Click(object sender, EventArgs e)
        {
            Session["page"] = "ci";
            Response.Redirect(String.Format("reception_app.aspx?ID={0}&name={1}", Server.UrlEncode(rci_id.Text), Server.UrlEncode(rci_name.Text)));
        }

        protected void rci_cancel_Click(object sender, EventArgs e)
        {
            fillTextBoxes(Convert.ToInt32(Request.QueryString["ID"]));
            rci_editname.Visible = false;
            rci_surname.Visible = false;
            rci_fathers.Visible = false;
            rci_save.Visible = false;
            rci_cancel.Visible = false;
            rci_fathnameLab.Visible = false;
            rci_nameLab.Visible = false;
            rci_surnameLab.Visible = false;
            rci_name.Visible = true;

            rci_birthday.ReadOnly = true;
            ddlGender.Enabled = false;
            rci_email.ReadOnly = true;
            rci_address.ReadOnly = true;
            rci_phonenumber.ReadOnly = true;
            rci_cit.Enabled = false;
            rci_zip.ReadOnly = true;
            rci_phonenumber.ReadOnly = true;
        }
    }
}


