using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminCust_ProfileCheck : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Admin_Customer_profile_search_btn_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd1 = new SqlCommand("SELECT * from CUSTOMER where EMAIL = '" + Admin_Cust_Profile_email_text.Text.Trim() + "';", conn);
                SqlDataReader reader = cmd1.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Customer_first_name.Text = reader.GetValue(1).ToString();
                        Customer_Last_name.Text = reader.GetValue(2).ToString();
                        Customer_gender.Text = reader.GetValue(3).ToString();
                        Customer_Email.Text = reader.GetValue(4).ToString();
                        Customer_Address.Text = reader.GetValue(5).ToString();
                        Customer_city.Text = reader.GetValue(8).ToString();
                        Customer_phone_number.Text = reader.GetValue(6).ToString();
                        Customer_DateOfBirth.Text = reader.GetValue(9).ToString();
                        Customer_password.Text = reader.GetValue(7).ToString();
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