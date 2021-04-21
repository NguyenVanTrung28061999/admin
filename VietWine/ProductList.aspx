<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sách sản phẩm - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!-- ProductList -->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="TrangChu">
            <a href="index.aspx">Trang Chủ</a>
            <span>/</span>
            <a href="productlist.aspx">Sản Phẩm</a>
        </div>
        <div class="MenuCoff">
            <h1>Danh sách sản phẩm</h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size: 36px'></i>
            </div>
        </div>
    </div>
    <div class="groupSearch-Sort">
        <div class="group-Sort">
            <div>
                <h3>Theo giá</h3>
            </div>
            <select class="form-Control-SanPham" id="Filter-SanPham">
                <option value="null">
                    <p>Không lựa chọn</p>
                </option>
                <option value="DownToUp">
                    <p>Từ thấp đến cao</p>
                </option>
                <option value="UptoDown">
                    <p>Từ cao đến thấp</p>
                </option>
            </select>
        </div>
        
    </div>
    <section class="container animatedParent" data-sequence='500' id="product-list">
        <ul class="row animated bounceInRight slowest" data-id='3'>
            <asp:Repeater ID="Repeater_Main" runat="server">
                <ItemTemplate>
                    <li class="col-6 col-md-3">
                        <a href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                            <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                        </a>
                        <a href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                            <%# Eval("Title") %>
                        </a>
                        <br />
                        <strong><%# Eval("Price","{0:0,0Đ}") %></strong>

                        <asp:UpdatePanel runat="server" ID="UpdatePanel_Main">
                                <ContentTemplate>
                                    <asp:LinkButton runat="server" ID="LinkButton_Cart"
                                        OnClick="LinkButton_Cart_Click"
                                        CommandArgument='<%# Eval("ID") %>'
                                        CommandName="1"
                                        class="tool">
                                <i class="fa fa-cart-plus mr-1" style="margin-left: 4px; color: #fff; font-size: 1.7rem;"> 
                                   Thêm vào giỏ
                                </i>
                                    </asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </section>
    <!-- Paging -->
    <uc1:ucPagging runat="server" ID="ucPagging" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

