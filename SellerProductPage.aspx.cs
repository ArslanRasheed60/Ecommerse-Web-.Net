using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace DB_MAKAN_UL_TAJARAH
{
    public partial class SellerProductPage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Seller_user_name.Text = "Hello  " + Session["PersonName"].ToString();
            Seller_email_name.Text = Session["PersonEmail"].ToString();
            //categoryfills();
        }


        void categoryfills()
        {
            try
            {

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("select [NAME] from CATEGORY", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "NAME";
                DropDownList1.DataBind();


                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void SellerProductButton_Click(object sender, EventArgs e)
        {
            try
            {
                //Response.Write("<script>alert('" + DropDownList1.SelectedItem.Value + "')</script>");

                string filename = Path.GetFileName(SellerProductFile.PostedFile.FileName);
                SellerProductFile.SaveAs(Server.MapPath("Image_inventory/" + filename));
                string filepath = "~/Image_inventory/" + filename;

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }



                SqlCommand cmd = new SqlCommand("declare @success char(1) execute AddSellerProduct '" + Seller_product_name.Text.Trim() + "','" + Session["PersonEmail"].ToString() + "','" + DropDownList1.SelectedItem.Value + "','" + Seller_product_quantity.Text + "','" + Seller_Product_Discount.Text + "','" + Seller_product_Price.Text + "','" + filepath + "',@success output select @success as success", conn);

                SqlDataReader Reader = cmd.ExecuteReader();

                string value = "";
                while (Reader.Read())
                    value = Reader[0].ToString();

                if (value == "0")
                {
                    Response.Write("<script>alert('Failed')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Successful')</script>");
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