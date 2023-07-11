<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerProductDetails.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.SellerProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class=" container rounded bg-white mt-5 mb-5">

        <%-- top two buttons --%>
        <div class="row p-4">
            
             <div class="d-flex flex-row">
                <div class="m-2">
                    <a href="SellerProfilePage.aspx">
                        <input class="btn btn-secondary" id="btnSetting" type="button"  value="Setting" />
                    </a>
                </div>
                 <div class="m-2">
                     <a href="SellerProductPage.aspx">
                        <input class="btn btn-secondary" id="btnAddProduct" type="button"  value="Add Products" />
                    </a>
                 </div>
                 <div class="m-2">
                     <a href="SellerProductDetails.aspx">
                        <input class="btn btn-secondary" id="btnProductDetails" type="button"  value="Product Details" />
                    </a>
                 </div>
            </div>
        </div>

        <%-- table and left profile --%>
        <div class="row ">
            <div class="col-md-3 ">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="round-circle mt-5" style="width:150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"/>
                   <asp:Label ID="Seller_user_name" class="font-weight-bold" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Seller_email_name" class="text-black-50" runat="server" Text=""></asp:Label>

                </div>
                
            </div>

            <%-- table details --%>
            <div class="col-md-8 ">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Product Details</h4>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="Seller_product_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MAKAN_UL_TIJARAHConnectionString %>" SelectCommand="show_current_seller_products" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Email" SessionField="PersonEmail" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView ID="Seller_product_GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="Seller_product_SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                                    <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>


                </div>
            </div>
        </div>
       
    </div>

</asp:Content>
