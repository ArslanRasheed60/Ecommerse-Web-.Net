<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerProfilePage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.CustomerProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class=" container rounded bg-white mt-5 mb-5">

        <div class="row p-4">
            
            <div class="d-flex flex-row">
                <div class="m-2">
                    <a href="CustomerProfilePage.aspx">
                        <input class="btn btn-secondary" id="btnSetting" type="button"  value="Setting" />
                    </a>
                </div>
                 <div class="m-2">
                     <a href="CustomerPurchaseDetails.aspx">
                        <input class="btn btn-secondary" id="btnPurchaseDetails" type="button"  value="Purchase Details" />
                    </a>
                 </div>
                <div class="m-2">
                     <a href="CustomerFeedbackPage.aspx">
                        <input class="btn btn-secondary" id="btnFeedback" type="button"  value="Product Feedback" />
                    </a>
                 </div>
            </div>

        </div>
        <div class="row ">
            <div class="col-md-4 ">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="round-circle mt-5" style="width:150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"/>
                    <asp:Label ID="Customer_user_name" class="font-weight-bold" runat="server" Text="a"></asp:Label>
                    <asp:Label ID="Customer_email_name" class="text-black-50" runat="server" Text="$"></asp:Label>

                </div>
                
            </div>
            <div class="col-md-7 ">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">First Name</label>
                            <asp:TextBox ID="Customer_first_name" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Last Name</label>
                            <asp:TextBox ID="Customer_Last_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels text-black-50">Email</label>
                            <asp:TextBox ID="Customer_Email" type="email" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-12">
                            <label class="labels text-black-50">Address</label>
                            <asp:TextBox ID="Customer_Address" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label class="labels text-black-50">City</label>
                            <asp:TextBox ID="Customer_city" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels text-black-50">Phone Number</label>
                            <asp:TextBox ID="Customer_phone_number" class="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-12">
                            <label class="labels text-black-50">Date of Birth</label>
                            <asp:TextBox type="date" TextMode="Date" ID="Customer_DateOfBirth" class="form-control" value="0" runat="server" ></asp:TextBox>

                        </div>
                    </div>
                     <%-- ++for password change --%>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Previous Password</label>
                            <asp:TextBox ID="Customer_Previous_password" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">New Password</label>
                            <asp:TextBox ID="Customer_new_password" type="password" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <%-- --for password change --%>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Country</label>
                            <asp:TextBox ID="Customer_Country" class="form-control" runat="server" value="Pakistan"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Gender</label>
                            <asp:TextBox ID="Customer_gender" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex justify-content-center align-item-center">
                <div class="mb-5 text-center">
                    <asp:Button class="btn btn-primary profile-button" ID="CustomerProfileUpdateBtn" runat="server" Text="Update Profile" OnClick="CustomerProfileUpdateBtn_Click" />
                </div>
            </div>
        </div>

        
    </div>

</asp:Content>
