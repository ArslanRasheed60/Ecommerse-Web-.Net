using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Admin_BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT [Name] from [admin] where Email = '" + Admin_Email.Text.Trim() + "' AND [Password] = '" + Admin_Password.Text.Trim() + "';", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    string name = "";
                    while (reader.Read())
                        name = reader[0].ToString();

                    string welcomeNote = "Welcome " + name + "! ";
                    Response.Write("<script>alert(' " + welcomeNote + "')</script>");

                    Session["Admin_Name"] = name;
                    Session["Admin_Email"] = Admin_Email.Text.Trim();

                    Response.Redirect("adminMainPage.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials!')</script>");
                }
                conn.Close();

                //int count1 = (int)cmd.ExecuteScalar();

                //if (count1 != 0)
                //{
                //    Response.Write("<script>alert(' Welcome Admin! ')</script>");
                //}
                //else
                //{
                //    Response.Write("<script>alert('Invalid Credentials!')</script>");
                //}
                //conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


    }
}