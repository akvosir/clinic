using System;
using MySql.Data.MySqlClient;

using clinic;

namespace ClinicSite
{
    public partial class Site : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    //btnnRegister.Click += new EventHandler(this.Register_Click);
            //    //Check();
            //}
            
            
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
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
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


            using (MySqlConnection cnn = Connection())
            {

                MySqlCommand cmd = cnn.CreateCommand();

                cmd.CommandText = "INSERT INTO patient_card (surname, name, fathers_name, birthday, gender, email, address, city, zip_code) " +
                    "VALUES (?surname, ?name, ?fathers_name, ?birthday, ?gender, ?email, ?address, ?city, ?zip_code ); SELECT LAST_INSERT_ID()";

                
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

                object patientId = cmd.ExecuteScalar();

                LogInCommand(cnn, (UInt64)patientId).ExecuteNonQuery();
            }
        }

        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

        protected MySqlCommand LogInCommand(MySqlConnection cnn, UInt64 id)
        {
            MySqlCommand cmd = cnn.CreateCommand();

            cmd.CommandText = "INSERT INTO patient_login (id_patient, telephone, password) " +
                "VALUES (?id_patient, ?telephone, ?password)";

            cmd.Parameters.AddWithValue("?id_patient", id);
            cmd.Parameters.AddWithValue("?telephone", rec_number.Text);
            cmd.Parameters.AddWithValue("?password", reg_psswrd.Text);
            return cmd;
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            PatientCard();
            Response.Write("Here");
        }

        //protected void OkButton_Click(object sender, EventArgs e)
        //{
        //    using (MySqlConnection cnn = Connection())
        //    {

        //        MySqlCommand cmd = cnn.CreateCommand();

        //        cmd.CommandText = "select * from patient_login  where telephone = '" + log_phone.Text + "' and password = '" + password.Text + "'"; ;

        //        cmd.ExecuteNonQuery();
        //        DataTable dt = new DataTable();
        //        MySqlDataAdapter da = new MySqlDataAdapter();
        //        da.SelectCommand = cmd;
        //        da.Fill(dt);

        //        //filter by type 
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            Session["telephone"] = dr["telephone"].ToString();
        //            Response.Redirect("~/userCab.aspx");
        //        }
        //        cnn.Close();
        //    }
        //}
    }
}