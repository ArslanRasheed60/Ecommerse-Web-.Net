<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminOrderDetails.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.AdminOrderDetails" %>
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
                Order Details🎁;
            </h1>
        </div>

        <div class="row p-3 py-4">
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-5">
                        <asp:TextBox ID="Admin_Order_details_email_text" placeholder="Email" type="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="Admin_Order_details_remove_btn" CssClass="btn btn-outline-danger" runat="server" Text="Remove"  />
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
            <asp:SqlDataSource ID="Admin_order_SqlDataSource1" runat="server"></asp:SqlDataSource>
            <div class="col">
                <asp:GridView ID="Admin_order_GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" runat="server"></asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
