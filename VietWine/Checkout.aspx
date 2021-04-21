<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thanh toán - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!--checkout-->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="MenuCoff">
            <h1>THANH TOÁN ĐƠN HÀNG
            </h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size: 36px'></i>
            </div>
        </div>
    </div>
    <section class="checkout">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-10 form">
                    <h3 class="t-gray ">Thông Tin Khách Hàng - Giao Hàng - Nhận Hàng</h3>
                    <h2>
                         <uc1:ucMessage runat="server" ID="ucMessage" />
                    </h2>
                    <div>
                        <div class="form-group">
                            <input runat="server" id="input_FullName" class="form-control" type="text" placeholder="Họ tên quý khách..." />
                        </div>
                        <div class="form-group">
                            <input runat="server" id="input_Mobile" class="form-control" type="text" placeholder="Số điện thoại..." />
                        </div>
                        <div class="form-group">
                            <input runat="server" id="input_Email" class="form-control" type="text" placeholder="Emai liên hệ..." />
                        </div>
                        <div class="form-group">
                            <textarea runat="server" id="textarea_Address" class="form-control" rows="7" placeholder="Địa chỉ giao hàng..."></textarea>
                        </div>

                    </div>
                </div>

            </div>
            <div class="row shopping-cart col-12">
                <div class="cart-thead">
                    <div class="text-left thead-product"><span><span runat="server" id="span_Count1">0</span> sản phẩm đã mua<span></span></span></div>
                    <div class="text-center thead-price"><span class="nobr">Giá</span></div>
                    <div class="text-center thead-quantity">Số lượng</div>
                    <div class="text-center thead-total">Thành tiền</div>

                </div>
                <div class="cart-tbody w-100">
                    <asp:Repeater ID="Repeater_Main" runat="server">
                        <ItemTemplate>
                            <div class="item-cart">
                                <div class="tbody-product-img" style="width: 10%">
                                    <a class="product-image" href='<%#"/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                        <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                                    </a>
                                </div>
                                <div class="tbody-product-name" style="width: 30%">
                                    <h3 class="product-name">
                                        <a class="text2line" href='<%#"/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                            <%# Eval("Title") %>
                                        </a>
                                    </h3>
                                </div>
                                <div class="text-center tbody-price">
                                    <span class="item-price"><%# Eval("Price","{0:n0}đ") %></span>
                                </div>
                                <div class="text-center tbody-quantity">
                                    <div class="input_qty_pr">

                                        <input type="text" maxlength="3" readonly class="input_pop" value='<%# Eval("Quantity") %>'>
                                    </div>
                                </div>
                                <div class="text-center tbody-total">
                                    <span class="price">
                                        <%# (Eval("Quantity").ToUInt() * Eval("Price").ToDouble()).ToString("n0") %>đ
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="pay mr-lg-5">
                <div class="item-pay">
                     <label class="total">Tổng tiền hàng(<span runat="server" id="span_Count">0</span> sản phẩm):</label><span runat="server" id="span_Amount">12.000.222đ</span></div>
                <div class="item-pay">
                    <label class="carmoney">Phí vận chuyển:</label><span style="color: #ff0000">free khi mua hàng của chúng tôi</span></div>
                <div class="item-pay">
                     <label class="totals">Tổng thanh toán:</label><span class="sumpay" runat="server" id="span_Amount1">12.000.222đ</span></div>
            </div>
            <div class="btn-order">
                  <asp:LinkButton Text="Đặt hàng" ID="LinkButton_Chekout"
                    class="btn billproduct" runat="server"
                    OnClick="LinkButton_Chekout_Click" />
            </div>
        </div>
    </section>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

