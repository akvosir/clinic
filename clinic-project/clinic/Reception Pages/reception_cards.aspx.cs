using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
using System.Configuration;

namespace clinic
{
    public partial class reception_cards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Bind();
            }

        }

        protected void Bind()
        {
            using (MySqlConnection con = new MySqlConnection("Server = sql11.freemysqlhosting.net; Database = sql11175574;  Port = 3306; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT idpatient_card, surname, name, fathers_name, birthday, gender, email, " +
                    "address, city, zip_code, telephone  FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient"))
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

        protected void card_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            Session["page"] = "cards";
            Response.Redirect("reception_card_individual.aspx?ID=" + Server.UrlEncode(clickedRow.Cells[0].Text));
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }

        protected void search_btn_Click(object sender, EventArgs e)
        {
            this.Bind();
        }
    }
}
