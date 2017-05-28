using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;


//add pop up window, check for shit
namespace clinic
{
    public partial class reception_registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addPatient() {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; Allow User Variables=True"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO patient_card (surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                "VALUES (@surname, @name, @fathers_name, @birthday, @gender, @email, @address, @city, @zip_code; SET @var = (SELECT idpatient_card FROM patient_card ORDER BY idpatient_card DESC LIMIT 1);" +
                "INSERT INTO patient_login (id_patient, telephone) VALUES (@var, @telephone)", con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        command.Connection = con;
                        con.Open();
                        command.Parameters.AddWithValue("@surname", rec_surname.Text);
                        command.Parameters.AddWithValue("@name", rec_name.Text);
                        command.Parameters.AddWithValue("@fathers_name", rec_fathers.Text);
                        command.Parameters.AddWithValue("@birthday", rec_birthday.Text);
                        command.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                        command.Parameters.AddWithValue("@email", rec_email.Text);
                        command.Parameters.AddWithValue("@address", rec_address.Text);
                        command.Parameters.AddWithValue("@city", rec_city.Text);
                        command.Parameters.AddWithValue("@zip_code", rec_zip.Text);
                        command.Parameters.AddWithValue("@telephone", rec_number.Text);
                        command.ExecuteNonQuery();
                        command.Dispose();
                        con.Close();
                    }
                }
            }

        }

        protected void rec_submitButton_Click(object sender, EventArgs e)
        {
            //addPatient();
            Session["page"] = "reception_registration.aspx";
            Response.Redirect("reception_card_individual.aspx");
        }

    }
}