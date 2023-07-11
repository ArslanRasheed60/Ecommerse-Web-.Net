using System;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class CustomerFeedbackPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Customer_user_name.Text = "Hello  " + Session["PersonName"].ToString();
            Customer_email_name.Text = Session["PersonEmail"].ToString();
        }
    }
}