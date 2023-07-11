using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class userLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["Categories"] = "";
            Session["Search"] = "";
        }

        protected void L_BtnLogin1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('omg')</script>");

            try
            {

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd1 = new SqlCommand("SELECT count(*) from SELLER where EMAIL = '" + L_txtEmailInput.Text.Trim() + "' AND [PASSWORD] = '" + L_txtpassword.Text.Trim() + "';", conn);

                int count1 = (int)cmd1.ExecuteScalar();


                if (count1 != 0)
                {


                    SqlCommand sellerCMD = new SqlCommand("SELECT FIRSTNAME from SELLER where Email = '" + L_txtEmailInput.Text.Trim() + "' AND [Password] = '" + L_txtpassword.Text.Trim() + "';", conn);
                    SqlDataReader Sreader = sellerCMD.ExecuteReader();

                    string name = "";
                    while (Sreader.Read())
                        name = Sreader[0].ToString();

                    string welcomeNote = "Welcome " + name + " ! Logged in as a Seller ";
                    Response.Write("<script>alert(' " + welcomeNote + "')</script>");

                    Session["UserName"] = "Seller";
                    Session["PersonName"] = name;
                    Session["PersonEmail"] = L_txtEmailInput.Text.Trim();

                    Response.Redirect("homePage.aspx");
                    //Response.Write("<script>alert('Hey! Login Successful as a Seller!!')</script>");

                    conn.Close();
                }
                else
                {
                    SqlCommand cmd2 = new SqlCommand("SELECT count(*) from CUSTOMER where EMAIL = '" + L_txtEmailInput.Text.Trim() + "' AND [PASSWORD] = '" + L_txtpassword.Text.Trim() + "';", conn);

                    int count2 = (int)cmd2.ExecuteScalar();
                    if (count2 != 0)
                    {

                        SqlCommand CustomerCMD = new SqlCommand("SELECT FIRSTNAME from CUSTOMER where Email = '" + L_txtEmailInput.Text.Trim() + "' AND [Password] = '" + L_txtpassword.Text.Trim() + "';", conn);
                        SqlDataReader Creader = CustomerCMD.ExecuteReader();

                        string name = "";
                        while (Creader.Read())
                            name = Creader[0].ToString();

                        string welcomeNote = "Welcome " + name + " ! Logged in as a Customer ";
                        Response.Write("<script>alert(' " + welcomeNote + "')</script>");

                        Session["UserName"] = "Customer";
                        Session["PersonName"] = name;
                        Session["PersonEmail"] = L_txtEmailInput.Text.Trim();

                        Response.Redirect("homePage.aspx");

                        //Response.Write("<script>alert('Hey ! Login Successful as a Customer!!')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Hey! Make Your Account First BEWAKOOF!!')</script>");
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