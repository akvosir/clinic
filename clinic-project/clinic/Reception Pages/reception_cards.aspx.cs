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

        }

        protected void Bind()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone  FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient "))
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

                            fillCards(con, cmd);

                        }
                    }
                }
            }

            
        }

        protected void card_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Session["page"] = "cards";
            Response.Redirect("reception_card_individual.aspx?ID=" + Server.UrlEncode(clickedRow.Cells[0].Text));
        }

        protected void fillCards(MySqlConnection thisConnection, MySqlCommand thisCommand)
        {
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
                string Telephone = reader.GetString(10);
                Card card = new Card(Surname, Name, Fathers_name, Birthday, Gender, Email, Address, City, Zip_code, Telephone);

                if (!PatientSet.set.Contains(id))
                {
                    PatientSet.set.Add(id, card);
                }
                else {
                }

            }

            thisConnection.Close();
        }

    }
}
