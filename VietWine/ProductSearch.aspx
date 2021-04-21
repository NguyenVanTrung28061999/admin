<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductSearch.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Danh sách Tìm kiếm  - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <!-- ProductList -->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="TrangChu">
            <a href="index.aspx">Trang Chủ</a>
            <span>/</span>
            <a href="productlist.aspx">Sản Phẩm</a>
        </div>
        <div class="MenuCoff">
            <h1>Danh sách tìm kiếm sản phẩm</h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size:36px'></i>
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
        <div class="boderPhanChia"></div>
        <div class="group-Search">
            <div>
                <h3>Tìm kiếm</h3>
            </div>
            <input type="text" id="inputSearchSanPham" placeholder="Tên Sản Phẩm">
            <a class="btn-SearchSanPham" id="btn-SearchSanPham"><i class="fa fa-search" style='font-size:18px'></i></a>
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
                        <a href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'><%# Eval("Title") %>
                        </a>
                        <br />
                        <strong><%# Eval("Price","{0:0,0Đ}") %></strong>

                        <div class="tool">
                            <a href='<%# Eval("ID","/ProductDetail.aspx?id={0}") %>'>
                                <i class="fa fa-eye mr-1" style="margin-left: 4px; color: #fff;">Xem Nhanh
                                </i>
                            </a>

                            <a href="#">
                                <i class="fa fa-cart-plus mr-1" style="margin-left: 4px; color: #fff;">Mua Hàng
                                </i>
                            </a>

                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

            
        </ul>
    </section>
    <!-- Paging -->
    <uc1:ucpagging runat="server" id="ucPagging" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

