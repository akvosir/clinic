using System;
using MySql.Data.MySqlClient;
using System.Data;

namespace ClinicSite
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Check();
                //Bind();
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

        protected void Bind()
        {
            using (MySqlConnection con = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'"))
            {

                using (MySqlCommand cmd = new MySqlCommand("SELECT doctor_name, doctor_surname, doctor_fathersname FROM  doctors WHERE doctor_specialty = 'Терапевт'"))
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
                                //doctors.DataSource = ds;
                                //visit_table.DataBind();
                                //visit_table.UseAccessibleHeader = true;
                            }

                        }
                    }
                }
            }
        }
        
    }
}