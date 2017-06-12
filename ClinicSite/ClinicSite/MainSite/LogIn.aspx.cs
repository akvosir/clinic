using clinic;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicSite.MainSite
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Check();
            }

        }

        private void Check()
        {            
            try
            {
                using (MySqlConnection cn = Connection())
                {
                    cn.Open();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Can not connect to database');</script>");
            }

        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = localhost; Database = clinic_bd; Uid = root; Password = '12345'; CharSet = utf8");
            //MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }
              
        protected void LogInAcc_Click(object sender, EventArgs e)
        {        
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
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "test", "<script>alert('Incorrect data, please use real phone and password');</script>");
                }
                return null;
            }
        }
    }
}