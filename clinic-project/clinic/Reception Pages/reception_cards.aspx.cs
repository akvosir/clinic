using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class reception_cards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void createLB() {
        }

        public string getWhileLoopData()
        {
            
            string htmlStr = "";
            MySqlConnection thisConnection = new MySqlConnection(@"Data Source = localhost; Database = clinic; User Id = root; Password = 'root'");
            MySqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT * from patient_card";
            thisConnection.Open();
            MySqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string Surname = reader.GetString(1);
                string Name = reader.GetString(2);
                string Fathers_name = reader.GetString(3);
                DateTime Birthday = reader.GetDateTime(4);
                string Gender = reader.GetString(5);
                string Email = reader.GetString(6);
                string Address = reader.GetString(7);
                string City = reader.GetString(8);
                int Zip_code = reader.GetInt32(9);
                string Telephone = reader.GetString(10);
                //Card card = new Card(id, Surname, Name, Fathers_name, Birthday, Gender, Email, Address, City, Zip_code, Telephone);
                
                htmlStr += "<tr><td>" + id + "</td><td>" + Surname + " " + Name + " " + Fathers_name + "</td><td>" + Birthday.ToString("dd/MM/yyyy") 
                    + "</td><td>" + "<a href=\"reception_card_individual.aspx\">Картка</a>" + "</td></tr>";
            }
           
            thisConnection.Close();
            

            return htmlStr;
        }

    }
}

//get id from previous page
//get card from hashset
//fill textboxes with data