<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Giỏ hàng - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!--shopping-cart-->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="MenuCoff">
            <h1>GIỎ HÀNG</h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size: 36px'></i>
            </div>
        </div>
    </div>
    <section class="shopping-cart">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                    <div class="cart-thead">
                        <div class="text-left thead-product"><span>Sản phẩm<span></span></span></div>
                        <div class="text-center thead-price"><span class="nobr">Giá</span></div>
                        <div class="text-center thead-quantity">Số lượng</div>
                        <div class="text-center thead-total">Thành tiền</div>
                    </div>
                    <div class="cart_empry  text-center" id="div_cartempry" runat="server">
                        <img src="Image/cart-empty.png" class="img-fluid" />
                    </div>
                    <div class="cart-tbody" id="div_cartbody" runat="server">
                        <asp:Repeater ID="Repeater_Main" runat="server">
                            <ItemTemplate>
                                <div class="item-cart">
                                    <div class="tbody-product-img">
                                        <a class="product-image" href='<%#"/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                            <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                                        </a>
                                    </div>
                                    <div class="tbody-product-name">
                                        <h3 class="product-name">
                                            <a class="text2line" href='<%#"/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                                <%# Eval("Title") %>
                                            </a>
                                        </h3>
                                        <asp:LinkButton runat="server" ID="LinkButton_Remove" ClientIDMode="AutoID" OnClick="LinkButton_Remove_Click"
                                            CommandArgument='<%# Eval("ProductID") %>'
                                            class="remove-item">
                                               <i class="fa fa-times-circle"></i>Xóa sản phẩm
                                        </asp:LinkButton>
                                    </div>
                                    <div class="text-center tbody-price">
                                        <span class="item-price"><%# Eval("Price","{0:n0}đ") %></span>
                                    </div>
                                    <div class="text-center tbody-quantity">
                                        <div class="input_qty_pr">
                                            <asp:LinkButton runat="server" ID="LinkButton_Minus" ClientIDMode="AutoID"
                                                CommandArgument='<%# Eval("ProductID") %>'
                                                OnClick="LinkButton_Minus_Click"
                                                Text="-" class="btn-minus" />
                                            <input class="input_pop" maxlength="3" readonly type="text" value='<%# Eval("Quantity") %>' />
                                            <asp:LinkButton runat="server" ID="LinkButton_Plus" ClientIDMode="AutoID"
                                                CommandArgument='<%# Eval("ProductID") %>'
                                                OnClick="LinkButton_Plus_Click"
                                                class="btn-plus" Text="+" />
                                        </div>
                                    </div>
                                    <div class="text-center tbody-total">
                                        <span class="price">
                                            <%# (Eval("Quantity").ToUInt() * Eval("Price").ToDouble()).ToString("n0") %>đ
                                        </span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-lg-4 col-12 pb-4">
                    <div class="sumtotals">
                        <h3 class="my-sm-3 my-2  font-weight-bold">SỐ LƯỢNG: <span class="count" runat="server" id="span_Count">4 </span></h3>
                        <h3 class="my-sm-3 my-2 font-weight-bold">TỔNG TIỀN:</h3>
                        <div class="my-sm-5 my-3"><span class="total" runat="server" id="span_Amount">0đ</span></div>

                        <div class="cart-link">
                            <div class="link-cart my-sm-3 my-2">
                                <a href="CheckOut.aspx"><span>Đặt Hàng</span></a>
                            </div>

                            <div class="link-cart my-sm-3 my-2">
                                <a href="/"><span>Tiếp tục mua hàng</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

