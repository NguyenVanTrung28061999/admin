<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Chi tiết sản phẩm - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <!-- ProductDetail -->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="MenuCoff">
            <h1>
                Chi Tiết Sản Phẩm
            </h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size:36px'></i>
            </div>
        </div>
    </div>
    <section class="product-details">
        <asp:Repeater ID="Repeater_Main" runat="server">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class=" col-lg-5 col-xl-6 p-0">
                            <div class="img">
                                <img id="zoom" src='<%# Eval("Avatar") %>' data-zoom-image='<%# Eval("Avatar") %>'>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 VietY">

                            <h4>CÔNG TY TNHH TM &amp; XD RƯỢU VANG VIỆT Ý WINE CAM KẾT
                            </h4>
                            <div class="center">
                                <p>
                                    <i class="far fa-check-circle"></i>
                                    Giao hàng miễn phí nội thành
                                </p>

                                <p>
                                    <i class="far fa-check-circle"></i>
                                    Cam kết sản phẩm chính hãng, giá tốt nhất
                                </p>
                                <p>
                                    <i class="far fa-check-circle"></i>
                                    Thanh toán sau khi nhận hàng
                                </p>

                                <p>
                                    <i class="far fa-check-circle"></i>
                                    Đổi hàng trong vòng 5 ngày
                                </p>
                                <p>
                                    <i class="fas fa-phone-volume"></i>
                                    <span>Cửa hàng:</span>
                                    024.2269.6999
                                </p>
                                <p>
                                    <i class="fas fa-phone-volume"></i>
                                    <span>Liên hệ giá sỉ:</span>
                                    0988.191.800
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-7 col-xl-6 p-0">
                            <div class="product-info">
                                <div id="accordion">
                                    <asp:Repeater ID="Repeater_ProductInfo" runat="server" DataSource='<%# Eval("ProductInfo")%>'>
                                        <ItemTemplate>
                                            <div class="card">
                                                <div class="card-header" id="headingOne" data-toggle="collapse" data-target='<%# "#thongso" + Eval("ProductInfoID")%>' aria-expanded="true" aria-controls="collapseOne">
                                                    <h5 class="mb-0">
                                                        <button type="button" class="btn btn-link">
                                                            <%# Eval("Title") %>
                                                        </button>
                                                    </h5>
                                                </div>

                                                <div id='<%# "thongso" + Eval("ProductInfoID")%>' class="collapse card-content" aria-labelledby="headingOne" data-parent="#accordion">
                                                    <div class="card-body">
                                                        <%# Eval("Description") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-xl-6 p-0">
                            <div class="relative">
                                <img class="img-fluid image" src="Image/h1.jpg" />
                                <%--<img class="img-fluid image" src='<%# Eval("BgAvatar2") %>' />--%>
                                <div class="content">
                                    <div class="content_box">
                                        <h3>ĐẶC TRƯNG – NGUỒN GỐC</h3>
                                         <%# Eval("AddressProduct") %>
                                       
                                         <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="mt-4 mt-sm-5 text-center">
                                                    <div class="btn-quantity">
                                                        <asp:LinkButton runat="server" ID="LinkButton_Minus" ClientIDMode="AutoID"
                                                            CommandName="1"
                                                            OnClick="LinkButton_Minus_Click"
                                                            class="btn-minicart"><i class="fas fa-minus"></i></asp:LinkButton>
                                                        <input class="input-quantity" runat="server" id="input_Quantity" readonly type="text" value="1" />
                                                        <asp:LinkButton runat="server" ID="LinkButton_Plus" ClientIDMode="AutoID"
                                                            CommandName="1"
                                                            OnClick="LinkButton_Plus_Click"
                                                            class="btn-minicart"><i class="fas fa-plus"></i></asp:LinkButton>
                                                    </div>

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel_Main" class="d-inline">
                                                        <ContentTemplate>
                                                            <asp:LinkButton runat="server" ID="LinkButton_Order"
                                                                ClientIDMode="AutoID"
                                                                OnClick="LinkButton_Order_Click"
                                                                CommandArgument='<%# Eval("ProductID") %>'
                                                                CommandName="1" class="btn btn-dark btn-buywine">THÊM VÀO GIỎ </asp:LinkButton>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                    <a href="CheckOut.aspx" class="btn btn-dark btn-buywine">THANH TOÁN </a>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
    <!-- slider-productdetail -->
    <section class="slider-main">
        <h3 class="title">SẢN PHẨM NỔI BẬT</h3>
        <div class="container owl-carousel owl-theme">
             <asp:Repeater ID="Repeater_Carousel" runat="server">
                    <ItemTemplate>
                        <div class="item">
                            <a href='<%# "/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                <img class="img-fluid py-xl-5 " src='<%# Eval("Avatar") %>' />
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

        </div>
    </section>
    
     <script>
         $("#zoom").elevateZoom({ scrollZoom: true });
         
        
     </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

