using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clinic
{
    public class BootstrapPage : Page
    {
        public enum WarningType
        {
            Success,
            Info,
            Warning,
            Danger
        }

        public void ShowNotification(string message, WarningType type)
        {
            var mainContentHolder = Master.FindControl("ContentPlaceHolderMain") as ContentPlaceHolder;
            Panel notificationPanel = new Panel();
            {
                LiteralControl closeButton = new LiteralControl();
                closeButton.Text = "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";

                Label notificationMessage = new Label() {
                    Text = message
                };

                notificationPanel.Controls.Add(closeButton);
                notificationPanel.Controls.Add(notificationMessage);
            }

            notificationPanel.CssClass = string.Format("alert alert-{0} alert-dismissable", type.ToString().ToLower());
            notificationPanel.Attributes.Add("role", "alert");

            mainContentHolder.Controls.AddAt(0, notificationPanel);
        }
    }
}