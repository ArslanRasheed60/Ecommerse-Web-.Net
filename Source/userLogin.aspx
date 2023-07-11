<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="maincontainer">
              <div class="row" style="width:170vh; height: 70vh;">
                  <div class="col-md-5 mx-auto" >
                      <div class="card custom_card" >
                          <div class="card-body">
                              <div class="row">
                                  <div class="col" >
                                      <center>
                                          <img style="clip-path: circle(50.0% at 50% 50%);" src="images/user-login.jpg" width="140" />
                                      </center>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col">
                                      <center>
                                          <h3><em>Member Login</em></h3>
                                      </center>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col">
                                      <center>
                                          <hr />
                                      </center>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col p-3 ">
                                      <div class="form-floating m-3">

                                                <asp:TextBox ID="L_txtEmailInput" type="email" CssClass="form-control"   placeholder="name@example.com" runat="server"></asp:TextBox>
                                                <%--<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">--%>
                                                <label for="L_txtEmailInput">Email address</label>

                                        </div>
                                        <div class="form-floating m-3 ">
                                                <asp:TextBox ID="L_txtpassword" type="password" CssClass="form-control"   placeholder="Password" runat="server"></asp:TextBox>
                                                <label for="L_txtpassword">Password</label>
                                        </div>

                                      <div style="display:flex; justify-content:space-around;" class="p-2">
                                          
                                           <asp:Button class="btn custom-btn" style="background-color:cornflowerblue; width:150px" ID="L_BtnLogin1" runat="server" Text="Login" OnClick="L_BtnLogin1_Click" />
                                          <asp:LinkButton href="userSignUp.aspx" class="btn custom-btn" style="background-color:chocolate; width:150px" ID="L_BtnSignUp" runat="server">Sign Up</asp:LinkButton>
                                      </div>


                                      <div class="incorrect_check incorrect_check_hidden">
                                                <p style="color:orange; font-weight:500";>
                                                    Incorrect Password
                                            </p>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
     </div>

</asp:Content>
