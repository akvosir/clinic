using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {

            }
        }

        protected void rec_submitButton_Click(object sender, EventArgs e)
        {
            /*Card c = new Card();
            c.Name = rec_name.Text;
            c.Surname = rec_surname.Text;
            c.Fathers_name = rec_fathers.Text;
            c.Birthday = DateTime.Parse(rec_birthday.Text);//time(??????)
            c.Gender = rec_gender.Text;
            c.Email = rec_email.Text;
            c.Address = rec_address.Text;
            c.City = rec_city.Text;
            c.Zip = Int32.Parse(rec_zip.Text);

            int id = PatientSet.set.Count + 1;
            PatientSet.set.Add(id, c);

            MySqlConnection connection = new MySqlConnection(@"Data Source = localhost; Database = clinic; User Id = root; Password = 'root'"); 
            MySqlCommand command = connection.CreateCommand();
            command.CommandText = "INSERT INTO patient_card (idpatient_card, surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                "VALUES (?idpatient_card, ?surname, ?name, ?fathers_name, ?birthday, ?gender, ?email, ?address, ?city, ?zip_code )";
            command.Parameters.AddWithValue("?idpatient_card", id);
            command.Parameters.AddWithValue("?surname", c.Surname);
            command.Parameters.AddWithValue("?name", c.Name);
            command.Parameters.AddWithValue("?fathers_name", c.Fathers_name);
            command.Parameters.AddWithValue("?birthday", c.Birthday);
            command.Parameters.AddWithValue("?gender", c.Gender);
            command.Parameters.AddWithValue("?email", c.Email);
            command.Parameters.AddWithValue("?address", c.Address);
            command.Parameters.AddWithValue("?city", c.City);
            command.Parameters.AddWithValue("?zip_code", c.Zip);
            connection.Open();
            command.ExecuteNonQuery();
            */
        }

        /*protected void Bind()
        {MySqlCommand cmd = new MySqlCommand("Insert into student (Name,Address,Mobile,Email )
values (@Name,@Address,@Mobile,@Email)", conn);
                cmd.Parameters.AddWithValue("@Name",txtName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Mobile",txtMobile.Text);
                cmd.Parameters.AddWithValue("@Email",txtEmail.Text);
                cmd.ExecuteNonQuery();               
                cmd.Dispose(); 
            }*/
    }
}