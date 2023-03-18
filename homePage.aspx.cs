using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class homePage : System.Web.UI.Page
    {
        //private EventHandler linkButton_Click;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            //Session["UserName"] = "";

            if (Session["UserName"].Equals(""))
            {

            }
            else if (Session["UserName"].Equals("Seller"))
            {
                home_product_btn.Visible = false;
            }
            else if (Session["UserName"].Equals("Customer"))
            {
                home_product_btn.Visible = true;
            }


            p_available.Visible = true;
            p_unavailable.Visible = false;

            if (Session["Categories"].Equals(""))
            {

                string picturequery = "select top 10 imagePath from ITEMS";
                string nameQuery = "select top 10 NAME from ITEMS";
                string priceQuery = "select top 10 PRICE from ITEMS";
                string quantityQuery = "select top 10 STOCK from ITEMS";

                getPictures(picturequery);
                getNames(nameQuery);
                getPrices(priceQuery);
                getquantity(quantityQuery);

                if (Session["Search"].Equals(""))
                {
                    //Response.Write("<script>alert('Search Field is Empty')</script>");
                }
                else
                {

                    try
                    {
                        SqlConnection conn = new SqlConnection(strcon);
                        if (conn.State == System.Data.ConnectionState.Closed)
                        {
                            conn.Open();
                        }

                        SqlCommand cmd = new SqlCommand("select count(*) from ITEMS where Name LIKE CONCAT('%',(select lower('" + Session["Search"] + "')) , '%')", conn);

                        int c = (int)cmd.ExecuteScalar();

                        if (c == 0)
                        {
                            p_available.Visible = false;
                            p_unavailable.Visible = true;
                        }
                        else
                        {
                            string picturequery1 = "execute return_image_while_search '" + Session["Search"] + "'";
                            string nameQuery1 = "execute return_name_while_search '" + Session["Search"] + "'";
                            string priceQuery1 = "execute return_price_while_search '" + Session["Search"] + "'";
                            string quantityQuery1 = "execute return_stock_while_search '" + Session["Search"] + "'";

                            getPictures(picturequery1);
                            getNames(nameQuery1);
                            getPrices(priceQuery1);
                            getquantity(quantityQuery1);
                        }

                        conn.Close();

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");
                    }


                }

            }
            else
            {

                string picturequery = "select top 10 i.imagePath from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID where c.NAME = '" + Session["Categories"] + "'";
                string nameQuery = "select top 10 i.NAME from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID where c.NAME =  '" + Session["Categories"] + "'";
                string priceQuery = "select top 10 i.PRICE from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID where c.NAME =  '" + Session["Categories"] + "'";
                string quantityQuery = "select top 10 i.STOCK from ITEMS i join CATEGORY c on i.CATEGORY_ID = c.ID where c.NAME =  '" + Session["Categories"] + "'";

                getPictures(picturequery);
                getNames(nameQuery);
                getPrices(priceQuery);
                getquantity(quantityQuery);

            }

        }

        void getPictures(string query)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                //SqlCommand cmd = new SqlCommand("select top 10 imagePath from ITEMS", conn);
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader dr = cmd.ExecuteReader();

                int count = 1;

                while (dr.Read())
                {

                    string img = dr.GetString(0);
                    //Response.Write("<script>alert('" + dr.GetString(0) + "')</script>");

                    if (count == 1)
                    {
                        Image1.ImageUrl = img;
                    }
                    else if (count == 2)
                    {
                        Image2.ImageUrl = img;
                    }
                    else if (count == 3)
                    {
                        Image3.ImageUrl = img;
                    }
                    else if (count == 4)
                    {
                        Image4.ImageUrl = img;
                    }
                    else if (count == 5)
                    {
                        Image5.ImageUrl = img;
                    }
                    else if (count == 6)
                    {
                        Image6.ImageUrl = img;
                    }
                    else if (count == 7)
                    {
                        Image7.ImageUrl = img;
                    }
                    else if (count == 8)
                    {
                        Image8.ImageUrl = img;
                    }
                    else if (count == 9)
                    {
                        Image9.ImageUrl = img;
                    }
                    else if (count == 10)
                    {
                        Image10.ImageUrl = img;
                    }

                    count++;
                }

                int rem = count / 2;


                homerow1.Visible = true;
                homerow2.Visible = true;
                homerow3.Visible = true;
                homerow4.Visible = true;
                homerow5.Visible = true;
                row1col2.Visible = true;
                row2col2.Visible = true;
                row3col2.Visible = true;
                row4col2.Visible = true;
                row5col2.Visible = true;
                row1space.Visible = true;
                row2space.Visible = true;
                row3space.Visible = true;
                row4space.Visible = true;
                row5space.Visible = true;


                if (rem == 1)
                {
                    homerow2.Visible = false;
                    homerow3.Visible = false;
                    homerow4.Visible = false;
                    homerow5.Visible = false;
                    if (count % 2 == 0)
                    {
                        row1col2.Visible = false;
                        row1space.Visible = false;
                    }
                }
                else if (rem == 2)
                {
                    homerow3.Visible = false;
                    homerow4.Visible = false;
                    homerow5.Visible = false;
                    if (count % 2 == 0)
                    {
                        row2col2.Visible = false;
                        row2space.Visible = false;
                    }
                }
                else if (rem == 3)
                {
                    homerow4.Visible = false;
                    homerow5.Visible = false;
                    if (count % 2 == 0)
                    {
                        row3col2.Visible = false;
                        row3space.Visible = false;
                    }
                }
                else if (rem == 4)
                {
                    homerow5.Visible = false;
                    if (count % 2 == 0)
                    {
                        row4col2.Visible = false;
                        row4space.Visible = false;
                    }
                }
                else if (rem == 5)
                {
                    if (count % 2 == 0)
                    {
                        row5col2.Visible = false;
                        row5space.Visible = false;
                    }
                }

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getNames(string query)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                //SqlCommand cmd = new SqlCommand("select top 10 NAME from ITEMS", conn);
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                int count = 1;

                while (dr.Read())
                {

                    string txt = dr.GetString(0);
                    //Response.Write("<script>alert('" + dr.GetString(0) + "')</script>");

                    if (count == 1)
                    {
                        Label1.Text = txt;
                    }
                    else if (count == 2)
                    {
                        Label2.Text = txt;
                    }
                    else if (count == 3)
                    {
                        Label3.Text = txt;
                    }
                    else if (count == 4)
                    {
                        Label4.Text = txt;
                    }
                    else if (count == 5)
                    {
                        Label5.Text = txt;
                    }
                    else if (count == 6)
                    {
                        Label6.Text = txt;
                    }
                    else if (count == 7)
                    {
                        Label7.Text = txt;
                    }
                    else if (count == 8)
                    {
                        Label8.Text = txt;
                    }
                    else if (count == 9)
                    {
                        Label9.Text = txt;
                    }
                    else if (count == 10)
                    {
                        Label10.Text = txt;
                    }

                    count++;
                }




                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getPrices(string query)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                //SqlCommand cmd = new SqlCommand("select top 10 PRICE from ITEMS", conn);
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader dr = cmd.ExecuteReader();

                int count = 1;

                while (dr.Read())
                {

                    string txt = dr.GetValue(0).ToString() + " Rs";
                    //Response.Write("<script>alert('" + dr.GetString(0) + "')</script>");

                    if (count == 1)
                    {
                        Price1.Text = txt;
                    }
                    else if (count == 2)
                    {
                        Price2.Text = txt;
                    }
                    else if (count == 3)
                    {
                        Price3.Text = txt;
                    }
                    else if (count == 4)
                    {
                        Price4.Text = txt;
                    }
                    else if (count == 5)
                    {
                        Price5.Text = txt;
                    }
                    else if (count == 6)
                    {
                        Price6.Text = txt;
                    }
                    else if (count == 7)
                    {
                        Price7.Text = txt;
                    }
                    else if (count == 8)
                    {
                        Price8.Text = txt;
                    }
                    else if (count == 9)
                    {
                        Price9.Text = txt;
                    }
                    else if (count == 10)
                    {
                        Price10.Text = txt;
                    }

                    count++;
                }

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void getquantity(string query)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                //SqlCommand cmd = new SqlCommand("select top 10 STOCK from ITEMS", conn);
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader dr = cmd.ExecuteReader();

                int count = 1;

                while (dr.Read())
                {

                    string txt = dr.GetValue(0).ToString();
                    //Response.Write("<script>alert('" + dr.GetString(0) + "')</script>");

                    if (count == 1)
                    {
                        TextBox2.Text = txt;
                    }
                    else if (count == 2)
                    {
                        TextBox4.Text = txt;
                    }
                    else if (count == 3)
                    {
                        TextBox6.Text = txt;
                    }
                    else if (count == 4)
                    {
                        TextBox8.Text = txt;
                    }
                    else if (count == 5)
                    {
                        TextBox10.Text = txt;
                    }
                    else if (count == 6)
                    {
                        TextBox12.Text = txt;
                    }
                    else if (count == 7)
                    {
                        TextBox14.Text = txt;
                    }
                    else if (count == 8)
                    {
                        TextBox16.Text = txt;
                    }
                    else if (count == 9)
                    {
                        TextBox18.Text = txt;
                    }
                    else if (count == 10)
                    {
                        TextBox20.Text = txt;
                    }

                    count++;
                }

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void home_product_btn_Click(object sender, EventArgs e)
        {
            //if (Session["UserName"].Equals(""))
            //{
            //    Response.Redirect("userLogin.aspx");
            //}

            Response.Write("<script>alert('" + TextBox1.Text + "')</script>");

        }
    }
}