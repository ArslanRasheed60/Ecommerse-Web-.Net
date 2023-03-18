using System;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_user_name.Text = Session["Admin_Name"].ToString();
            Admin_email_name.Text = Session["Admin_Email"].ToString();
        }
    }
}