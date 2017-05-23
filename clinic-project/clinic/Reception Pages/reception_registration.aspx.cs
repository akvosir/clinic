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
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; charset=utf8"))
            {
                using (MySqlCommand command = new MySqlCommand("INSERT INTO patient_card (surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                "VALUES (@surname, @name, @fathers_name, @birthday, @gender, @email, @address, @city, @zip_code )", con))
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

                        command.ExecuteNonQuery();
                        command.Dispose();
                        con.Close();
                    }
                }
            }

        }

        protected void rec_submitButton_Click(object sender, EventArgs e)
        {
            addPatient();
            Response.Redirect("reception_cards.aspx");
        }

    }
}