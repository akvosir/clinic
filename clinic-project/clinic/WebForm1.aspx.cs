using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls;


namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bind();
        }

        protected void Bind()
        {
            using (MySqlConnection con = new MySqlConnection(@"Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient "))
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
        }
    }
}