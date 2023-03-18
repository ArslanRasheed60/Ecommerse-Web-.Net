<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminCustomerDetails.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.AdminCustomerDetails" %>
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
                Customers List✨;
            </h1>
        </div>

        <div class="row p-3 py-4">
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-5">
                        <asp:TextBox ID="Admin_Cust_details_email_text" placeholder="Email" type="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="Admin_Cust_details_remove_btn" CssClass="btn btn-outline-danger" runat="server" Text="Remove" OnClick="Admin_Cust_details_remove_btn_Click" />
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

            <asp:SqlDataSource ID="Admin_customer_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MAKAN_UL_TIJARAHConnectionString %>" SelectCommand="SELECT * FROM [Customer_list_show]"></asp:SqlDataSource>
            <div class="col">
                <asp:GridView CssClass="table table-striped table-bordered" ID="Admin_customer_GridView1" AutoGenerateColumns="False" runat="server" DataSourceID="Admin_customer_SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="FIRSTNAME" HeaderText="Name" SortExpression="FIRSTNAME" />
                        <asp:BoundField DataField="GENDER" HeaderText="Gender" SortExpression="GENDER" />
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                        <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        
    </div>

</asp:Content>
