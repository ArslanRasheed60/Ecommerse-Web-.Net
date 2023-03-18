using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminCustomerDetails : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin_customer_GridView1.DataBind();
        }

        protected void Admin_Cust_details_remove_btn_Click(object sender, EventArgs e)
        {
            if (check_valid_Email())
            {
                Response.Write("<script>alert('Customer Not Exits')</script>");
            }
            else
            {
                delete_Customer();
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

                SqlCommand cmd = new SqlCommand("Select count(*) from CUSTOMER where EMAIL = '" + Admin_Cust_details_email_text.Text.Trim() + "'", conn);

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


        void delete_Customer()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from CUSTOMER where EMAIL = '" + Admin_Cust_details_email_text.Text.Trim() + "'", conn);

                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Deletion Successfull !!')</script>");

                Admin_customer_GridView1.DataBind();

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}