using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicSite
{
    public partial class UserFunctions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void docChoose_Click(object sender, EventArgs e)
        {
            Response.Redirect("chooceDoctor.aspx?");
        }

        protected void visits_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            Response.Redirect("receptionResult.aspx?ID=" + Server.UrlEncode(id));
        }

    }
}