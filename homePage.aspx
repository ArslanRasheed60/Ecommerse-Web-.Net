<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="DB_MAKAN_UL_TAJARAH.homePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="p_unavailable" class="d-flex justify-content-center align-items-center" visible="false" style="height:85vh;" runat="server">
        <h1 class="custom-heading" style="font-size:50px">
            Product Unavailable!
        </h1>
    </div>

    <div id="p_available" runat="server" visible="true">
            <div class="d-flex justify-content-center align-items-center" style="height:40vh;">
            <h1 class="custom-heading" style="font-size:50px">
                Want Something New?
            </h1>
        </div>
        <div class="d-flex justify-content-center align-items-center" style="height:20vh;">
            <h2 class="custom-heading" style="font-size:40px">
                Check our Products..🙂
            </h2>
        </div>



         <section class="material_section layout_padding">
            <div class="container">
              <div class="row align-items-center justify-content-center" id="homerow1" runat="server">
                <div class="col-md-5 col-lg-4">
                  <div class="box">
                    <div class="img-box">
                        <%--<img src="images/i_attar.jpg" />--%>
                        <%--<asp:Image ID="Image1" src="images/i_attar.jpg" runat="server" />--%>
                        <asp:Image style="width: 290px;height: 215px;" ID="Image1" runat="server" />
                    </div>
                    <div class="detail-box">
                        <asp:Label style="color:white;" ID="Label1" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                        <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox1" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                    <asp:Label style="color:white;" ID="Price1" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox2" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="col-md-2 col-lg-1" id="row1space" runat="server"></div>
                <div class="col-md-5 col-lg-4" id="row1col2" runat="server">
                  <div class="box">
                    <div class="img-box">
                  
                        <asp:Image style="width: 290px;height: 215px;" ID="Image2" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label2" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox3" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price2" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox4" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row align-items-center justify-content-center" id="homerow2" runat="server">
            
                <div class="col-md-5 col-lg-4">
                  <div class="box">
                    <div class="img-box">
                 
                        <asp:Image style="width: 290px;height: 215px;" ID="Image3" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label3" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox5" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price3" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox6" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="col-md-2 col-lg-1" id="row2space" runat="server"></div>
                <div class="col-md-5 col-lg-4" id="row2col2" runat="server">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image4" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label4" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox7" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price4" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox8" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row align-items-center justify-content-center" id="homerow3" runat="server">
                <div class="col-md-5 col-lg-4">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image5" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label5" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox9" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price5" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox10" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="col-md-2 col-lg-1" id="row3space" runat="server"></div>
                <div class="col-md-5 col-lg-4" id="row3col2" runat="server">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image6" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label6" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox11" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price6" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox12" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
               </div>
              <div class="row align-items-center justify-content-center" id="homerow4" runat="server">
                <div class="col-md-5 col-lg-4">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image7" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label7" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox13" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price7" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox14" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="col-md-2 col-lg-1" id="row4space" runat="server"></div>
                <div class="col-md-5 col-lg-4" id="row4col2" runat="server">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image8" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label8" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox15" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price8" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox16" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
               </div>
              <div class="row align-items-center justify-content-center" id="homerow5" runat="server">
                <div class="col-md-5 col-lg-4">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image9" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label9" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox17" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price9" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox18" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="col-md-2 col-lg-1" id="row5space" runat="server"></div>
                <div class="col-md-5 col-lg-4" id="row5col2" runat="server">
                  <div class="box">
                    <div class="img-box">
                        <asp:Image style="width: 290px;height: 215px;" ID="Image10" runat="server" />
                    </div>
                    <div class="detail-box">
                      <asp:Label style="color:white;" ID="Label10" runat="server" Text=""></asp:Label>
                      <div class="price_box">
                          <div class="row">
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none;" ID="TextBox19" type="number" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-8">
                                <h6 class="price_heading">
                                  <asp:Label style="color:white;" ID="Price10" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox style="width:40px;border-radius:5px 5px;border:none; background-color:white;" ID="TextBox20" Text="0" runat="server" Disabled="true"></asp:TextBox>
                            </div>
                         </div>
                    
                      </div>
                    </div>
                  </div>
                </div>
               </div>

          
                <div class="d-flex align-items-center justify-content-center p-5 py-5">
                  <asp:Button ID="home_product_btn" CssClass="btn btn-primary" style="width:170px;" runat="server" Text="Buy" OnClick="home_product_btn_Click" />      
              </div>

            </div>
          </section>
    </div>

    
    


</asp:Content>
