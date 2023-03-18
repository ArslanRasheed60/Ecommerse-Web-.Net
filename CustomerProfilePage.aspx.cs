using System;
using System.Configuration;
using System.Data.SqlClient;


namespace DB_MAKAN_UL_TAJARAH
{
    public partial class CustomerProfilePage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Customer_user_name.Text = "Hello  " + Session["PersonName"].ToString();
            Customer_email_name.Text = Session["PersonEmail"].ToString();

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from CUSTOMER where EMAIL = '" + Session["PersonEmail"] + "';", conn);

                SqlDataReader reader = cmd.ExecuteReader();

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
                        Session["Customer_password"] = reader.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Data not accessesd')</script>");
                }


                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        protected void CustomerProfileUpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE CUSTOMER set FIRSTNAME = @FIRSTNAME ,LASTNAME = @LASTNAME , GENDER = @GENDER , EMAIL = @EMAIL , ADDRESS = @ADDRESS , CONTACT = @CONTACT , [PASSWORD] = @PASSWORD ,CITY = @CITY ,DateOfBirth = @DateOfBirth where EMAIL = '" + Session["PersonEmail"] + "'", conn);

                cmd.Parameters.AddWithValue("@FIRSTNAME", Customer_first_name.Text.Trim());
                cmd.Parameters.AddWithValue("@LASTNAME", Customer_Last_name.Text.Trim());
                cmd.Parameters.AddWithValue("@GENDER", Customer_gender.Text.Trim());
                cmd.Parameters.AddWithValue("@EMAIL", Customer_Email.Text.Trim());
                cmd.Parameters.AddWithValue("@ADDRESS", Customer_Address.Text.Trim());
                cmd.Parameters.AddWithValue("@CONTACT", Customer_phone_number.Text.Trim());
                cmd.Parameters.AddWithValue("@CITY", Customer_city.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", Customer_DateOfBirth.Text.Trim());

                if (Customer_Previous_password.Text.Trim() == Session["Customer_password"].ToString().Trim())
                {
                    cmd.Parameters.AddWithValue("@PASSWORD", Customer_new_password.Text.Trim());
                    Response.Write("<script>alert('Profile Updated Successfully🙂')</script>");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PASSWORD", Session["Customer_password"].ToString().Trim());
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