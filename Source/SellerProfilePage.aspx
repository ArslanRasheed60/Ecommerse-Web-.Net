<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerProfilePage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.SellerProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <h2 class="text-right">Profile Settings</h2>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">First Name</label>
                            <%--<input id="Seller_first_name" type="text" class="form-control" value="abc">--%>
                            <asp:TextBox ID="Seller_first_name" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Last Name</label>
                            <%--<input type="text" class="form-control" value="abc">--%>
                            <asp:TextBox ID="Seller_Last_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels text-black-50">Email</label>
                            <asp:TextBox ID="Seller_Email" type="email" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-12">
                            <label class="labels text-black-50">Address</label>
                            <asp:TextBox ID="Seller_Address" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label class="labels text-black-50">City</label>
                            <asp:TextBox ID="Seller_city" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels text-black-50">Phone Number</label>
                            <asp:TextBox ID="Seller_phone_number" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-12">
                            <label class="labels text-black-50">Date of Birth</label>
                            <asp:TextBox type="date" TextMode="Date" ID="Seller_DateOfBirth" class="form-control" value="0" runat="server" ></asp:TextBox>

                        </div>
                    </div>
                     <%-- ++for password change --%>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Previous Password</label>
                            <asp:TextBox ID="Seller_Previous_password" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">New Password</label>
                            <asp:TextBox ID="Seller_new_password" type="password" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <%-- --for password change --%>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Country</label>
                            <asp:TextBox ID="Seller_Country" class="form-control" runat="server" value="Pakistan"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Gender</label>
                            <asp:TextBox ID="Seller_gender" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex justify-content-center align-item-center">
                <div class="mb-5 text-center">
                    <%--<button class="btn btn-primary profile-button" type="button">Update Profile</button>--%>
                    <asp:Button class="btn btn-primary profile-button" ID="SellerProfileUpdateBtn" runat="server" Text="Update Profile" OnClick="SellerProfileUpdateBtn_Click" />
                </div>
            </div>
        </div>

        
    </div>
</asp:Content>
