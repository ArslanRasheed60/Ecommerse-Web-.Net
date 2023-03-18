<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerFeedbackPage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.CustomerFeedbackPage" %>
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
                    <%-- feedback code here --%>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex justify-content-center align-item-center">
                <div class="mb-5 text-center">
                    <asp:Button class="btn btn-primary profile-button" ID="CustomerSubmitBtn" runat="server" Text="Submit" />
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
