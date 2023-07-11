<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminCust_ProfileCheck.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.AdminCust_ProfileCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row p-3 mt-4 ">
            <div class="col-md-4">
                <h1>
                    Customer Profile
                </h1>
            </div>

            <div class="col-md-8">
                <div class="row mt-2 d-flex justify-content-end">
                    <div class="col-md-5">
                        <asp:TextBox ID="Admin_Cust_Profile_email_text" placeholder="Email" type="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="Admin_Cust_profile_search_btn" CssClass="btn btn-outline-primary" runat="server" Text="Search" OnClick="Admin_Customer_profile_search_btn_Click" />
                    </div>
                </div>
            </div>

        </div>

        <div class="row px-4">
             <div class="col-md-2"></div>
             <div class="col-md-8">
                <div class="p-3 ">
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">First Name</label>
                            <asp:TextBox ID="Customer_first_name" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Last Name</label>
                            <asp:TextBox ID="Customer_Last_name" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Email</label>
                            <asp:TextBox ID="Customer_Email" type="email" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Password</label>
                            <asp:TextBox ID="Customer_password" type="password" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <%--  --%>
                    <div class="row mt-3">
                        
                        
                        <div class="col-md-12">
                            <label class="labels text-black-50">Address</label>
                            <asp:TextBox ID="Customer_Address" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Phone Number</label>
                            <asp:TextBox ID="Customer_phone_number" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">City</label>
                            <asp:TextBox ID="Customer_city" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels text-black-50">Date of Birth</label>
                            <asp:TextBox ID="Customer_DateOfBirth" class="form-control" ReadOnly="True" runat="server" ></asp:TextBox>

                        </div>
                        <div class="col-md-6">
                            <label class="labels text-black-50">Gender</label>
                            <asp:TextBox ID="Customer_gender" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        
        
    </div>

</asp:Content>
