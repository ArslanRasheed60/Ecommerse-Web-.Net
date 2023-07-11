using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminSellerDetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_seller_GridView1.DataBind();
        }

        protected void Admin_seller_details_remove_btn_Click(object sender, EventArgs e)
        {

            if (check_valid_Email())
            {
                Response.Write("<script>alert('Seller Not Exits')</script>");
            }
            else
            {
                delete_Seller();
            }


        }


        bool check_valid_Email()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("Select count(*) from SELLER where EMAIL = '" + Admin_seller_details_email_text.Text.Trim() + "'", conn);

                int count = (int)cmd.ExecuteScalar();


                conn.Close();

                if (count == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        void delete_Seller()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from SELLER where EMAIL = '" + Admin_seller_details_email_text.Text.Trim() + "'", conn);

                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Deletion Successfull !!')</script>");

                Admin_seller_GridView1.DataBind();

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}