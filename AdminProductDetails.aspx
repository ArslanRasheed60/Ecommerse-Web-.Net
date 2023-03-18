<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminProductDetails.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.AdminProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row p-3 py-4">
            <h1>
                Product Details✨;
            </h1>
        </div>

        
         <div class="row p-3 py-2">
            <div class="col">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label ID="Label1" runat="server" Text="Product"></asp:Label>
                        <asp:TextBox ID="Admin_Prod_name_text" placeholder="Product Name" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="Label2" runat="server" Text="Seller"></asp:Label>
                        <asp:TextBox ID="Admin_Seller_name_text" placeholder="Seller Name" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="Label3" runat="server" Text="Category"></asp:Label>
                        <asp:TextBox ID="Admin_Category_name_text" placeholder="Category Name" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <div class="pt-4">
                            <asp:Button ID="Admin_Prod_details_remove_btn" CssClass="btn btn-outline-danger" runat="server" Text="Remove" OnClick="Admin_Prod_details_remove_btn_Click" />
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3 mb-3">
            <div class="col">
                <hr>
            </div>
        </div>

        <div class="row">
            <asp:SqlDataSource ID="Admin_product_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MAKAN_UL_TIJARAHConnectionString %>" SelectCommand="SELECT * FROM [Item_list_show]"></asp:SqlDataSource>
            <div class="col">
                <asp:GridView  ID="Admin_product_GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" runat="server" DataSourceID="Admin_product_SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Item_Name" HeaderText="Product" SortExpression="Item_Name" />
                        <asp:BoundField DataField="FIRSTNAME" HeaderText="Seller" SortExpression="FIRSTNAME" />
                        <asp:BoundField DataField="category_name" HeaderText="Category" SortExpression="category_name" />
                        <asp:BoundField DataField="STOCK" HeaderText="Stock" SortExpression="STOCK" />
                        <asp:BoundField DataField="DISCOUNT" HeaderText="Discount" SortExpression="DISCOUNT" />
                        <asp:BoundField DataField="PRICE" HeaderText="Price" SortExpression="PRICE" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
