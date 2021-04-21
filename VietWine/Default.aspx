<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucProductHome.ascx" TagPrefix="uc1" TagName="ucProductHome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Trang chủ - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <section class="container-fluid p-0 banner-main">
        <div class="banner">
            <div class="img w-100">
                <img src="Image/MainPicture/ong-chu-tham-vuon-nho.jpg" alt="Việt Ý Wine" class="img-fluid">
            </div>
        </div>
        <div class="video-main" id="video" style="display: none;">
            <video width="871" height="490" autoplay muted preload="auto" poster="Images/Carousel/ong-chu-tham-vuon-nho.jpg">
                <source src="Image/videomain.mp4" type="video/mp4" />
            </video>
        </div>
    </section>

    <uc1:ucProductHome runat="server" ID="ucProductHome" />

    <!-- slider-main -->
    <section class="slider-main">
        <h3 class="title">SẢN PHẨM NỔI BẬT</h3>
        <div class="container owl-carousel owl-theme">
            <asp:Repeater ID="Repeater_ProductHot" runat="server">
                <ItemTemplate>
                    <div class="item">
                        <a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}") %>'>
                            <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
           

        </div>
    </section>
    <!-- manufacturer-main -->
    <section class="manufacturer-main">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <a href="#" class="manufacturer-img">
                        <div class="overlay-gray"></div>
                        <img class="img-fluid" src="Image/h1.jpg" />
                    </a>
                </div>
                <div class="col-md-6 col-sm-12">
                    <a href="#" class="manufacturer-img">
                        <div class="overlay-gray"></div>
                        <img class="img-fluid" src="Image/h2.jpg" />
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- contact-main -->
    <section class="contact-main">
        <div class="container-fluid p-0">
            <div class="bg-image">
                <div class="overlay-gray"></div>
                <img class="img-fluid" src="Uploads/MainPicture/parallax-img.jpg" />

            </div>
            <div class="contact-content">
                <h4>NGUYÊN LIỆU SẠCH, AN TOÀN VÀ THÂN THIỆN VỚI MÔI TRƯỜNG</h4>
                <a class="btn btn-dark" href="#">TÌM HIỂU VỀ RƯỢU VANG</a>
            </div>
        </div>
    </section>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

