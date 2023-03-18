using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminProductDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_product_GridView1.DataBind();
        }

        protected void Admin_Prod_details_remove_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string product = Admin_Prod_name_text.Text.Trim();
                string seller = Admin_Seller_name_text.Text.Trim();
                string Category = Admin_Category_name_text.Text.Trim();

                if (product == "")
                    Response.Write("<script>alert('Product field is empty')</script>");
                else if (seller == "")
                    Response.Write("<script>alert('Seller field is empty')</script>");
                else if (Category == "")
                    Response.Write("<script>alert('Category field is empty')</script>");
                else
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("declare @flag int; execute delete_item_by_admin '" + product + "', '" + seller + "', '" + Category + "', @flag output select @flag as flag", conn);

                    int val = (int)cmd.ExecuteScalar();

                    if (val == 0)
                    {
                        Response.Write("<script>alert('Invalid Input')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Deleted Successfully')</script>");
                    }

                    conn.Close();
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}