using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class reception_registration : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addPatient() {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO patient_card (surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                "VALUES (@surname, @name, @fathers_name, @birthday, @gender, @email, @address, @city, @zip_code)", con))
                {
                    try
                    {
                        con.Open();
                        command.Parameters.AddWithValue("@surname", rec_surname.Text);
                        command.Parameters.AddWithValue("@name", rec_name.Text);
                        command.Parameters.AddWithValue("@fathers_name", rec_fathers.Text);
                        command.Parameters.AddWithValue("@birthday", DateTime.Parse(rec_birthday.Text));
                        command.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                        command.Parameters.AddWithValue("@email", rec_email.Text);
                        command.Parameters.AddWithValue("@address", rec_address.Text);
                        command.Parameters.AddWithValue("@city", rec_cit.SelectedValue);
                        command.Parameters.AddWithValue("@zip_code", Int32.Parse(rec_zip.Text));
                        command.ExecuteNonQuery();
                        addPhone();
                        con.Close();
                    }
                    catch (Exception ex) {
                        ShowNotification("Зверніться до адмінiстратора", WarningType.Danger);
                        throw ex;
                    }
                }
            }
        }

        protected void addPhone() {
            using (MySqlConnection con = new MySqlConnection(@"Server = localhost; Database = clinic; Uid = root; Password = root; charset=utf8"))
            {
                using (MySqlCommand command = new MySqlCommand("SELECT idpatient_card FROM patient_card WHERE name = @name AND surname = @surname AND " +
                    "fathers_name = @fathers_name AND birthday = @birthday", con))
                {
                    try
                    {
                        command.CommandType = CommandType.Text;
                        command.Parameters.AddWithValue("@name", rec_name.Text);
                        command.Parameters.AddWithValue("@surname", rec_surname.Text);
                        command.Parameters.AddWithValue("@fathers_name", rec_fathers.Text);
                        command.Parameters.AddWithValue("@birthday", DateTime.Parse(rec_birthday.Text));
                        con.Open();
                        int id = Int32.Parse(command.ExecuteScalar().ToString());

                        command.CommandText = "INSERT INTO patient_login (id_patient, telephone, password) VALUES (@id_patient, @telephone, @password)";
                        command.Parameters.AddWithValue("@id_patient", id);
                        command.Parameters.AddWithValue("@telephone", rec_number.Text);
                        command.Parameters.AddWithValue("@password", rec_password.Text);
                        
                        command.ExecuteNonQuery();
                    }
                    catch(Exception ex) {
                        ShowNotification("Зверніться до адмінiстратора", WarningType.Danger);
                        throw ex;
                    }
                }
            }
        }

        protected void rec_submitButton_Click(object sender, EventArgs e)
        {
            addPatient();
            Session["page"] = "reception_registration.aspx";
            Response.Redirect("reception_card_individual.aspx");
        }

    }
}