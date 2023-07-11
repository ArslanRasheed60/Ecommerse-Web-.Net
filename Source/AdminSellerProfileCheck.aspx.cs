using System;
using System.Configuration;
using System.Data.SqlClient;


namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminSellerProfileCheck : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Admin_seller_profile_search_btn_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd1 = new SqlCommand("SELECT * from SELLER where EMAIL = '" + Admin_seller_Profile_email_text.Text.Trim() + "';", conn);
                SqlDataReader reader = cmd1.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        A_Seller_first_name.Text = reader.GetValue(1).ToString();
                        A_Seller_Last_name.Text = reader.GetValue(2).ToString();
                        A_Seller_gender.Text = reader.GetValue(3).ToString();
                        A_Seller_Email.Text = reader.GetValue(4).ToString();
                        A_Seller_Address.Text = reader.GetValue(5).ToString();
                        A_Seller_city.Text = reader.GetValue(8).ToString();
                        A_Seller_phone_number.Text = reader.GetValue(6).ToString();
                        A_Seller_DateOfBirth.Text = reader.GetValue(9).ToString();
                        A_Seller_password.Text = reader.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email!!')</script>");
                }

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}