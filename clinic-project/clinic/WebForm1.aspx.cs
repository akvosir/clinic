using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using Telerik.Web.UI;
using System.Text;

namespace clinic
{
    public partial class WebForm1 : BootstrapPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TimeSpan t = TimeSpan.Parse(TextBox2.Text).Subtract(TimeSpan.Parse(TextBox1.Text));
            app_spec_date.Text = t.ToString();
        }
    }

}