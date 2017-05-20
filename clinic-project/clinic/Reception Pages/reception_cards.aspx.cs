using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace clinic
{
    public partial class reception_cards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Bind();
            }
            //govno, initialization of PatientSet

        }

        protected void Bind()
        {
            using (MySqlConnection con = new MySqlConnection(@"Data Source = localhost; Database = clinic; User Id = root; Password = 'root'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * from patient_card"))
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
                                GridView1.DataSource = ds;
                                GridView1.DataBind();
                                GridView1.UseAccessibleHeader = true;
                                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                            }

                        }
                    }
                }
            }

            fillCards();
        }

        protected void card_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Response.Redirect("reception_card_individual.aspx?ID=" + Server.UrlEncode(clickedRow.Cells[0].Text));
        }

        protected void fillCards()
        {
            MySqlConnection thisConnection = new MySqlConnection(@"Data Source = localhost; Database = clinic; User Id = root; Password = 'root'");
            MySqlCommand thisCommand = thisConnection.CreateCommand();
            thisCommand.CommandText = "SELECT * from patient_card";
            thisConnection.Open();
            MySqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                String Surname = reader.GetString(1);
                String Name = reader.GetString(2);
                String Fathers_name = reader.GetString(3);
                DateTime Birthday = reader.GetDateTime(4);
                String Gender = reader.GetString(5);
                String Email = reader.GetString(6);
                String Address = reader.GetString(7);
                String City = reader.GetString(8);
                int Zip_code = reader.GetInt32(9);
                //string Telephone = reader.GetString(10);
                Card card = new Card(Surname, Name, Fathers_name, Birthday, Gender, Email, Address, City, Zip_code);
                PatientSet.set.Add(id, card);
            }

            thisConnection.Close();
        }

    }
}
