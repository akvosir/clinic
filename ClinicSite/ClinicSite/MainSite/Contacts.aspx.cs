using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicSite.MainSite
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }

        protected void LogInAcc_Click(object sender, EventArgs e)
        {
            Response.Write("LogIn is Successful");
            int? id = GetUserID();

            if (id.HasValue)
            {
                Session["telephone"] = log_phone.Text;
                Session["id"] = id.Value;
                Response.Redirect("~/UserAccount/UserFunctions.aspx");
            }
        }

        protected int? GetUserID()
        {
            using (MySqlConnection cnn = Connection())
            {
                try
                {
                    MySqlCommand cmd = cnn.CreateCommand();

                    cmd.CommandText = "SELECT id_patient FROM patient_login WHERE telephone = '" + log_phone.Text + "' and password = '" + log_psswrd.Text + "'";

                    cnn.Open();
                    var res = cmd.ExecuteScalar();

                    if (res != null)
                        return int.Parse(res.ToString());
                }
                catch (Exception ex)
                {
                }
                return null;
            }
        }
    }
}