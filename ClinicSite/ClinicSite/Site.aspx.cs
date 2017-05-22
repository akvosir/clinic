using System;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data;
using clinic;

namespace ClinicSite
{
    public partial class Site : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //btnnRegister.Click += new EventHandler(this.Register_Click);
                Check();
            }
            
            
        }

        private void Check()
        {
            string connection = @"Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'";
            using (MySqlConnection cn = new MySqlConnection(connection))
            {
                cn.Open();
                Response.Write("Successful");
            }
        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'");
            return connection;
        }
        
        protected void PatientCard()
        {
            RegistrationForm c = new RegistrationForm();
            c.Name = rec_name.Text;
            c.Surname = rec_surname.Text;
            c.Fathers_name = rec_fathers.Text;
            c.Birthday = DateTime.Parse(rec_birthday.Text);
            c.Gender = ddlGender.Text;
            c.Email = rec_email.Text;
            c.Address = rec_address.Text;
            c.City = rec_city.Text;
            c.Zip = Int32.Parse(rec_zip.Text);

            int id = PatientSet.set.Count + 1;
            PatientSet.set.Add(id, c);

            MySqlConnection cnn = Connection();

            MySqlCommand cmd = cnn.CreateCommand();

            cmd.CommandText = "INSERT INTO patient_card (idpatient_card, surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                "VALUES (?idpatient_card, ?surname, ?name, ?fathers_name, ?birthday, ?gender, ?email, ?address, ?city, ?zip_code )";

            cmd.Parameters.AddWithValue("?idpatient_card", id);
            cmd.Parameters.AddWithValue("?surname", c.Surname);
            cmd.Parameters.AddWithValue("?name", c.Name);
            cmd.Parameters.AddWithValue("?fathers_name", c.Fathers_name);
            cmd.Parameters.AddWithValue("?birthday", c.Birthday);
            cmd.Parameters.AddWithValue("?gender", c.Gender);
            cmd.Parameters.AddWithValue("?email", c.Email);
            cmd.Parameters.AddWithValue("?address", c.Address);
            cmd.Parameters.AddWithValue("?city", c.City);
            cmd.Parameters.AddWithValue("?zip_code", c.Zip);
            cnn.Open();
            cmd.ExecuteNonQuery();
        }

        protected void LogIn()
        {
            RegistrationForm c = new RegistrationForm();
            c.Telephone = rec_number.Text;
            c.Password = reg_psswrd.Text;

            int id = PatientSet.set.Count + 1;
            PatientSet.set.Add(id, c);

            MySqlConnection cnn = Connection();

            MySqlCommand cmd = cnn.CreateCommand();

            cmd.CommandText = "INSERT INTO patient_login (id_patient, telephone, password) " +
                "VALUES (?id_patient, ?telephone, ?password)";

            cmd.Parameters.AddWithValue("?id_patient", id);
            cmd.Parameters.AddWithValue("?telephone", c.Telephone);
            cmd.Parameters.AddWithValue("?password", c.Password);
            cnn.Open();
            cmd.ExecuteNonQuery();
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Write("Here");
            //PatientCard();
            //LogIn();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Button1_Click");
        }
    }
}