<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adminMainPage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.adminMainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="container">
        <div class="row p-3 py-5 text-center">
            <h1 style="text-align:center">
                <asp:Label ID="AdminMainPage_Name" runat="server" Text="Hello Admin!🙂🙂"></asp:Label>
            </h1>
        </div>
        <div class="row p-2 py-3 px-5">
            <h4>
                This is Current Status!!
            </h4>
        </div>
        <div class="row p-3 px-5">
             <div class="col-md-2 mb-2">
                 <div id="cardvalue_sales" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Sales</p>
                                     <asp:Label ID="Sales_Count" CssClass="mb-3" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-2 mb-2">
                 <div id="cardvalue_customer" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Customers</p>
                                     <asp:Label ID="Customer_count" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-2 mb-2">
                 <div id="cardvalue_seller" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Sellers</p>
                                     <asp:Label ID="Seller_count" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-2 mb-2">
                 <div id="cardvalue_item" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Products</p>
                                     <asp:Label ID="Product_count" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
            <div class="col-md-2 mb-2">
                 <div id="cardvalue_feedback" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Feedbacks</p>
                                     <asp:Label ID="Feedback_count" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
            <div class="col-md-2 mb-2">
                 <div id="cardvalue_total" class="card adminSmallCards " runat="server">
                     <div class="cardbody ">
                         <div class="row">
                             <div class="col mt-3">
                                 <center>
                                     <img style="width:20px;" src="fontawesome/svgs/regular/user.svg" />
                                     <p class="mt-3">Total Users</p>
                                     <asp:Label ID="TUser_Count" runat="server" Text="0"></asp:Label>
                                     <p></p>
                                 </center>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
        </div>
    </div>

</asp:Content>
