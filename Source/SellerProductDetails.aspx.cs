using System;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class SellerProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Seller_user_name.Text = "Hello  " + Session["PersonName"].ToString();
            Seller_email_name.Text = Session["PersonEmail"].ToString();
            Seller_product_GridView1.DataBind();
        }


    }
}