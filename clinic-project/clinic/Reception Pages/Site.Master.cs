using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                name.Text = UserS.surname + " " + UserS.name + " " + UserS.fathers_name;
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            UserS.id = 0;
            UserS.name = null;
            UserS.surname = null;
            UserS.fathers_name = null;
            Response.Redirect("~/Login Page/LoginPage.aspx");
        }
    }
}