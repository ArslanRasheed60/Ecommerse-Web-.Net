<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="maincontainer">
               <div class="card signupcard">
                   <div class="card-body">
                       <div class="row" >
                           <div class="col" style="display:flex; justify-content: center">
                               <h3 style="font-weight:700;"><em>Sign Up😎</em></h3>
                           </div>
                       </div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="SU_txtFirstName">First Name</label>
                                <asp:TextBox ID="SU_txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="SU_txtLastName">Last Name</label>
                                <asp:TextBox ID="SU_txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="SU_inputEmail4" class="form-label">Email</label>
                                <asp:TextBox ID="SU_inputEmail4" type="email" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                 <label for="SU_inputPassword4" class="form-label">Password</label>
                                 <asp:TextBox ID="SU_inputPassword4" type="password" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                             <label for="SU_inputAddress" class="form-label">Address</label>
                            <asp:TextBox ID="SU_inputAddress" type="text" class="form-control" placeholder="House # ...." runat="server"></asp:TextBox>
                         </div>

                       <div class="row g-3">
                               <div class="col-md-6">
                                    <label for="SU_inputCity" class="form-label">City</label>
                                    <asp:TextBox ID="SU_inputCity" type="text" class="form-control" runat="server"></asp:TextBox>
                              </div>
                              <div class="col-md-6">
                                    <label for="SU_phoneNumber" class="form-label">Phone Number</label>
                                    <asp:TextBox ID="SU_phoneNumber" type="number" class="form-control" runat="server"></asp:TextBox>
                              </div>
                       </div>
                       <div class="row g-3 p-3">
                           <div class="col-md-6" style="margin-top:50px;">
                               <div class="row d-flex">
                                   <div class="col-md-3">
                                       <label>Gender:</label>
                                   </div>
                                   <div class="col">
                                       <asp:RadioButtonList ID="SU_GenderID" runat="server" RepeatDirection="Horizontal">
                                           <asp:ListItem Text="&nbsp Male &nbsp" Value="M" />
                                            <asp:ListItem Text="&nbsp Female" Value="F" />
                                       </asp:RadioButtonList>
                                   </div>
                               </div>

                           </div>
                           <div class="col-md-6">
                               <label for="SU_DateOfBirth" class="form-label">Date of Birth &nbsp </label>
                               <asp:TextBox type="date" TextMode="Date" ID="SU_DateOfBirth" class="form-control" value="0" runat="server" ></asp:TextBox>
                           </div>
                       </div>
                       <div class="row g-3">
                           <div class="col-md-6" style="display:flex; justify-content: center" >
                               <asp:Button ID="btnSellerSignUP1" class="btn customsignupbtn" style="background-color:blueviolet;" runat="server" Text="Sign Up As Seller" OnClick="btnSellerSignUP1_Click" />
                               
                           </div>
                           <div class="col-md-6" style="display:flex; justify-content: center" >
                               <asp:Button ID="btnCustomerSignUP" class="btn customsignupbtn" style="background-color:forestgreen;" runat="server" Text="Sign Up As Customer" OnClick="btnCustomerSignUP_Click" />
                           </div>
                       </div>
                   </div>

            </div>

    </div>

</asp:Content>
