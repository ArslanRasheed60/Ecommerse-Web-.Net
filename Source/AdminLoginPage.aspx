<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.AdminLoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="maincontainer">

              <div class="row" style="width:170vh; height: 65vh;">
                  <div class="col-md-5 mx-auto" >
                      <div class="card custom_card" style="height:77vh" >
                          <div class="card-body">
                              <div class="row">
                                  <div class="col" >
                                      <center>
                                          <img style="clip-path: circle(43.8% at 50% 49%);" src="images/admin-login-icon-26.jpg" width="140" />
                                      </center>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col">
                                      <center>
                                          <h3><em>Admin Login</em></h3>
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

                                                <asp:TextBox ID="Admin_Email" type="email" CssClass="form-control"   placeholder="name@example.com" runat="server"></asp:TextBox>
                                                <label for="Admin_Email">Email address</label>

                                        </div>


                                        <div class="form-floating m-3 ">
                                                <asp:TextBox ID="Admin_Password" type="password" CssClass="form-control"   placeholder="Password" runat="server"></asp:TextBox>
                                                <label for="Admin_Password">Password</label>
                                        </div>

                                      <div style="display:flex; justify-content:space-around;" class="p-2">
                                          <%--<a href="adminMainPage.aspx">
                                              <%--<asp:Button class="btn custom-btn" style="background-color:cornflowerblue; width:150px" ID="btnlogin1" runat="server" Text="LogIn" />--%>
                                              <%--<input class="btn custom-btn" style="background-color:cornflowerblue; width:150px" id="adminbtnlogin" type="button"  value="LogIn" />--%>
                                          <%--</a>--%>
                                          <asp:Button class="btn custom-btn" style="background-color:cornflowerblue; width:150px" ID="Admin_BtnLogin" runat="server" Text="Button" OnClick="Admin_BtnLogin_Click" />
                                          
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
