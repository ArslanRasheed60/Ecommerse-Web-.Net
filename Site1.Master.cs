using System;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserName"].Equals(""))
                {
                    MasterBtnLogin.Visible = true;
                    MasterBtnSignup.Visible = true;
                    MasterLogoutBtn.Visible = false;
                    MasterHelloTextSeller.Visible = false;
                    MasterHelloTextCustomer.Visible = false;
                }
                else if (Session["UserName"].Equals("Seller"))
                {
                    MasterBtnLogin.Visible = false;
                    MasterBtnSignup.Visible = false;
                    MasterLogoutBtn.Visible = true;
                    MasterHelloTextSeller.Visible = true;
                    MasterHelloTextSeller.Text = "Hello " + Session["PersonName"];
                }
                else if (Session["UserName"].Equals("Customer"))
                {
                    MasterBtnLogin.Visible = false;
                    MasterBtnSignup.Visible = false;
                    MasterLogoutBtn.Visible = true;
                    MasterHelloTextCustomer.Visible = true;
                    MasterHelloTextCustomer.Text = "Hello " + Session["PersonName"];
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void MasterLogoutBtn_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void MasterHelloTextSeller_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerProfilePage.aspx");
        }

        protected void TasbeehBtn_Click(object sender, EventArgs e)
        {
            Session["Categories"] = "Tasbeeh";
            Session["Search"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void AttarBtn_Click(object sender, EventArgs e)
        {
            Session["Categories"] = "Attar";
            Session["Search"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void BooksBtn_Click(object sender, EventArgs e)
        {
            Session["Categories"] = "Books";
            Session["Search"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void CapsBtn_Click(object sender, EventArgs e)
        {
            Session["Categories"] = "Caps";
            Session["Search"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void mainHomePage_Click(object sender, EventArgs e)
        {
            Session["Categories"] = "";
            Session["Search"] = "";
            Response.Redirect("homePage.aspx");
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            Session["Search"] = SearchBox.Text.ToLower().Trim();
            Session["Categories"] = "";
            if (Session["Search"].Equals(""))
            {
                //
            }
            else
            {
                Response.Redirect("homePage.aspx");
            }
        }
    }
}