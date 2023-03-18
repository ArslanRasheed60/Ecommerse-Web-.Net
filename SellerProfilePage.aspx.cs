using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class SellerProfilePage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Seller_user_name.Text = "Hello  " + Session["PersonName"].ToString();
            Seller_email_name.Text = Session["PersonEmail"].ToString();


            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from SELLER where EMAIL = '" + Session["PersonEmail"] + "';", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Seller_first_name.Text = reader.GetValue(1).ToString();
                        Seller_Last_name.Text = reader.GetValue(2).ToString();
                        Seller_gender.Text = reader.GetValue(3).ToString();
                        Seller_Email.Text = reader.GetValue(4).ToString();
                        Seller_Address.Text = reader.GetValue(5).ToString();
                        Seller_city.Text = reader.GetValue(8).ToString();
                        Seller_phone_number.Text = reader.GetValue(6).ToString();
                        Seller_DateOfBirth.Text = reader.GetValue(9).ToString();
                        Session["Seller_password"] = reader.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('data not accessesd')</script>");
                }


                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }


        }

        protected void SellerProfileUpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE SELLER set FIRSTNAME = @FIRSTNAME ,LASTNAME = @LASTNAME , GENDER = @GENDER , EMAIL = @EMAIL , ADDRESS = @ADDRESS , CONTACT = @CONTACT , [PASSWORD] = @PASSWORD ,CITY = @CITY ,DateOfBirth = @DateOfBirth where EMAIL = '" + Session["PersonEmail"] + "'", conn);

                cmd.Parameters.AddWithValue("@FIRSTNAME", Seller_first_name.Text.Trim());
                cmd.Parameters.AddWithValue("@LASTNAME", Seller_Last_name.Text.Trim());
                cmd.Parameters.AddWithValue("@GENDER", Seller_gender.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", Seller_Email.Text.Trim());
                cmd.Parameters.AddWithValue("@ADDRESS", Seller_Address.Text.Trim());
                cmd.Parameters.AddWithValue("@CONTACT", Seller_phone_number.Text.Trim());
                cmd.Parameters.AddWithValue("@CITY", Seller_city.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", Seller_DateOfBirth.Text.Trim());

                if (Seller_Previous_password.Text.Trim() == Session["Seller_password"].ToString().Trim())
                {
                    cmd.Parameters.AddWithValue("@PASSWORD", Seller_new_password.Text.Trim());
                    Response.Write("<script>alert('Profile Updated Successfully🙂')</script>");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PASSWORD", Session["Seller_password"].ToString().Trim());
                    Response.Write("<script>alert('Password Updation Fails!')</script>");
                }

                cmd.ExecuteNonQuery();



                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}