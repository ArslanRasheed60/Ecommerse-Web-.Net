<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerProductPage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.SellerProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();


                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class=" container rounded bg-white mt-5 mb-5">

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
        <div class="row ">
            <div class="col-md-4 ">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="round-circle mt-5" style="width:150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"/>

                    <asp:Label ID="Seller_user_name" class="font-weight-bold" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Seller_email_name" class="text-black-50" runat="server" Text=""></asp:Label>

                </div>
                
            </div>
            <div class="col-md-7 ">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h2 class="text-right">Add Product</h2>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Name</label>
                            <asp:TextBox ID="Seller_product_name" class="form-control" placeholder="..."  runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-12">
                            <label class="labels">Quantity</label>
                            <asp:TextBox ID="Seller_product_quantity" type="number" class="form-control" placeholder="Add Quantity here"  runat="server"></asp:TextBox>

                        </div>

                        <div class="col-md-12">
                            <label class="labels">Price</label>
                            <asp:TextBox ID="Seller_product_Price" type="number" class="form-control" placeholder="Add Price here"  runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-12">
                            <label class="labels">Discount</label>
                            <asp:TextBox ID="Seller_Product_Discount" type="number" class="form-control" placeholder="..."  runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12">

                            <label class="labels">Add Product</label>
                            <div Style="border:1px solid #d0d4ce; border-radius:5px" class="p-1">
                                
                                <%--<asp:TextBox ID="Add Product" type="number" class="form-control" placeholder="..."  runat="server"></asp:TextBox>--%>
                                <asp:FileUpload pnchange="readURL(this);" ID="SellerProductFile" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12 ">

                            <label class="labels"> </label>

                            <div Style="border:1px solid #d0d4ce; border-radius:5px" class="p-1">

                                <label class="labels" style="margin-right:100px;">Category:  </label>
                                <asp:DropDownList ID="DropDownList1"  runat="server">
                                        <asp:ListItem Text="Caps" Value="Caps"/>
                                        <asp:ListItem Text="Books" Value="Books"/>
                                        <asp:ListItem Text="Tasbeeh" Value="Tasbeeh"/>
                                        <asp:ListItem Text="Attar" Value="Attar"/>
                                    </asp:DropDownList>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex justify-content-center align-item-center">
                <div class="mb-5 text-center">
                    <asp:Button class="btn btn-primary profile-button" ID="SellerProductButton" runat="server" Text="Add Product" OnClick="SellerProductButton_Click" />
                </div>
            </div>
        </div>

        
    </div>

</asp:Content>
