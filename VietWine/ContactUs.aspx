<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Liên hệ chúng tôi - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!-- Liên Hệ -->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="MenuCoff">
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size: 36px'></i>
            </div>
        </div>
    </div>
    <main>
        <section id="contact">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-12 col-md-6 form">
                        <div>
                            <h1>LIÊN HỆ
                            </h1>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                      <div class="form-group">
                                        <div runat="server" id="alert_Danger" class="alert alert-danger">
                                        </div>
                                        <div runat="server" id="alert_Success" class="alert alert-success">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input runat="server" id="input_FullName" class="form-control" type="text" placeholder="Họ tên quý khách..." />
                                    </div>
                                    <div class="form-group">
                                        <input runat="server" id="input_Email" class="form-control" type="text" placeholder="Emai liên hệ..." />
                                    </div>
                                    <div class="form-group">
                                        <input runat="server" id="input_Mobi" class="form-control" type="text" placeholder="Số điện thoại liên lạc..." />
                                    </div>
                                    <div class="form-group">
                                        <textarea runat="server" id="textarea_Content" class="form-control" rows="7" placeholder="Nội dung cần liên hệ..."></textarea>
                                    </div>
                                  
                                    <div class="form-group">
                                        <asp:LinkButton ID="LinkButton_Send" runat="server" OnClick="LinkButton_Send_Click" class="btn ">Gửi thư liên hệ</asp:LinkButton>
                                    </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                    <div class="col-12 col-md-6 info">
                        <div>
                            <p>
                                Hãy liên hệ để được tư vấn những dịch vụ tốt nhất một cách miễn phí!
                            </p>

                            <p>
                                <i class="fa fa-home"></i>
                                CÔNG TY TNHH TM &amp; XD VIỆT Ý
                            </p>

                            <p>
                                <i class="fa fa-map-marker"></i>
                                Nam Đồng, Đống Đa, Hà Nội
                            </p>
                            <p>
                                <i class="fa fa-phone"></i></i>
                                024.2269.6999
                            </p>

                            <p>
                                <i class="fa fa-envelope"></i>
                                Email: vietywine@vietygroup.vn
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

