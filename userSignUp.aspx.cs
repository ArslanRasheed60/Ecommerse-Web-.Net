using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class userSignUp : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomerSignUP_Click(object sender, EventArgs e)
        {
            if (NewCustomerCheck())
            {
                Response.Write("<script>alert('Fail!! Customer with this email already exists')</script>");
            }
            else
            {
                NewCustomerSignUp();
            }
        }

        //it will check customer is already exists or not
        bool NewCustomerCheck()
        {
            try
            {
                int count = 0;
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT count(*) from CUSTOMER where EMAIL = '" + SU_inputEmail4.Text.Trim() + "';", conn);

                count = (int)cmd.ExecuteScalar();

                conn.Close();
                if (count == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        //this will add the new customer to the database
        void NewCustomerSignUp()
        {
            try
            {
                int count = NewCustomerIDget();

                if (count != -1)
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO CUSTOMER (ID,FIRSTNAME,LASTNAME,GENDER,EMAIL,ADDRESS,CONTACT,[PASSWORD],CITY,DateOfBirth ) values (@ID,@FIRSTNAME,@LASTNAME,@GENDER,@EMAIL,@ADDRESS,@CONTACT,@PASSWORD,@CITY,@DateOfBirth)", conn);

                    cmd.Parameters.AddWithValue("@ID", count);
                    cmd.Parameters.AddWithValue("@FIRSTNAME", SU_txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LASTNAME", SU_txtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@GENDER", SU_GenderID.Text.Trim());
                    cmd.Parameters.AddWithValue("@EMAIL", SU_inputEmail4.Text.Trim());
                    cmd.Parameters.AddWithValue("@PASSWORD", SU_inputPassword4.Text.Trim());
                    cmd.Parameters.AddWithValue("@ADDRESS", SU_inputAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CONTACT", SU_phoneNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@CITY", SU_inputCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@DateOfBirth", SU_DateOfBirth.Text.Trim());


                    cmd.ExecuteNonQuery();

                    conn.Close();
                    Response.Write("<script>alert('Successful!! Use Login Page for login')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Database Value Fetching fails!!')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //number of customers get so that new id can be assigned to next customer
        int NewCustomerIDget()
        {
            try
            {
                int count = 0;
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT MAX(ID) from CUSTOMER;", conn);

                count = (int)cmd.ExecuteScalar();
                count++;

                conn.Close();

                return count;


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return -1;
            }
        }

        protected void btnSellerSignUP1_Click(object sender, EventArgs e)
        {
            if (NewSellerCheck())
            {
                Response.Write("<script>alert('Fail!! Seller with this email already exists')</script>");
            }
            else
            {
                NewSellerSignUp();
            }
        }

        //it will check seller is already exists or not

        bool NewSellerCheck()
        {
            try
            {
                int count = 0;
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("select count(*) from SELLER where EMAIL = '" + SU_inputEmail4.Text.Trim() + "';", conn);

                count = (int)cmd.ExecuteScalar();

                conn.Close();
                if (count == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        //this will add the new seller to the database
        void NewSellerSignUp()
        {
            try
            {
                int count = NewSellerIDget();

                if (count != -1)
                {

                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO SELLER (ID,FIRSTNAME,LASTNAME,GENDER,EMAIL,ADDRESS,CONTACT,[PASSWORD],CITY,DateOfBirth ) values (@ID,@FIRSTNAME,@LASTNAME,@GENDER,@EMAIL,@ADDRESS,@CONTACT,@PASSWORD,@CITY,@DateOfBirth)", conn);

                    cmd.Parameters.AddWithValue("@ID", count);
                    cmd.Parameters.AddWithValue("@FIRSTNAME", SU_txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LASTNAME", SU_txtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@GENDER", SU_GenderID.Text.Trim());
                    cmd.Parameters.AddWithValue("@EMAIL", SU_inputEmail4.Text.Trim());
                    cmd.Parameters.AddWithValue("@PASSWORD", SU_inputPassword4.Text.Trim());
                    cmd.Parameters.AddWithValue("@ADDRESS", SU_inputAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CONTACT", SU_phoneNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@CITY", SU_inputCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@DateOfBirth", SU_DateOfBirth.Text.Trim());


                    cmd.ExecuteNonQuery();

                    conn.Close();
                    Response.Write("<script>alert('Successful!! Use Login Page for login')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Database Value Fetching fails!!')</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //number of sellers get so that new id can be assigned to next seller
        int NewSellerIDget()
        {
            try
            {
                int count = 0;
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT MAX(ID) from SELLER ;", conn);

                count = (int)cmd.ExecuteScalar();
                count++;

                conn.Close();

                return count;


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return -1;
            }
        }
    }
}