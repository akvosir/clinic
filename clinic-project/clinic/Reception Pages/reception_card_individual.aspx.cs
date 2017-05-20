using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic
{
    public partial class reception_card_individual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Card c = new Card();
            string id = Request.QueryString["ID"];
            findPatient(Int32.Parse(id), PatientSet.set, c);
        }

        protected void findPatient(Int32 id, Hashtable hash, Card c) {
            if (hash.ContainsKey(id))
            {
                c = (Card)hash[id];
                rci_id.Text = id.ToString();
                fillTextBoxes(c);
            }

        }

        protected void fillTextBoxes(Card c) {
            rci_name.Text = c.Surname + " " + c.Name + " " + c.Fathers_name;

            rci_birthday.Text = c.Birthday.ToString();
            rci_gender.Text = c.Gender;
            rci_email.Text = c.Email;
            rci_address.Text = c.Address;
            rci_city.Text = c.City;
            rci_zip.Text = c.Zip.ToString();
        }
    }
}