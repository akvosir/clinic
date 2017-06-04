using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using clinic;

namespace ClinicSite
{
    public partial class UserFunctions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            HttpContext context = HttpContext.Current;
            if (context.Session["telephone"] != null)
            {
               string uPhone = (string)(Session["telephone"]);
                UserNameBind(uPhone);
            }
        }

        protected MySqlConnection Connection()
        {
            MySqlConnection connection = new MySqlConnection(@" Server = sql11.freemysqlhosting.net; Database = sql11175574; Uid = sql11175574; Password = 'jnFq8Gk5Gk'; CharSet = utf8");
            return connection;
        }
        
        protected void UserNameBind(string patientPhoneNum)
        {
            using (MySqlConnection cnn = Connection())
            {
                try
                {
                    MySqlCommand cmd = cnn.CreateCommand();

                    cmd.CommandText = "SELECT CONCAT_WS(' ', surname, name) AS 'UserName'" +
                    "FROM patient_card INNER JOIN patient_login ON idpatient_card = patient_login.id_patient " +
                    "WHERE patient_login.telephone = '" + patientPhoneNum + "'";

                    //cmd.CommandText = "SELECT telephone FROM patient_login WHERE telephone = '" + patientPhoneNum + "'";
                    cnn.Open();
                    var res = cmd.ExecuteScalar();

                    if (res != null)
                        UserName.Text = res.ToString();
                }
                catch (Exception ex)
                {
                }             
            }
        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Session["UserName"] = UserName.Text;
            Response.Redirect("chooseDoctor.aspx?");
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();        
            Response.Redirect("~/Site.aspx");
        }

        protected void visits_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Session["UserName"] = UserName.Text;
            Response.Redirect("Visits.aspx?ID=" + Server.UrlEncode(id));
        }

    }
}