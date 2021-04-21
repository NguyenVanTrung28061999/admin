<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMiniCart.ascx.cs" Inherits="ucMiniCart" %>

<a class="nav-link minicart" href="ShoppingCart.aspx">
    <i class="far fa-cart-arrow-down"></i>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <span class="minicart-quantity minicart-quantity-mobile" runat="server" id="span_Count">0</span>

        </ContentTemplate>
    </asp:UpdatePanel>
</a>
<div class="menu-mini-cart">
    <div class="box-list">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="cart_empry  text-center" id="div_cartempry" runat="server">
                    <img src="Image/cart-empty.png" class="img-fluid" />
                </div>
                <ul class="list-item-cart" id="div_cartbody" runat="server">
                    <asp:Repeater ID="Repeater_Main" runat="server">
                        <ItemTemplate>

                            <li class="cart-item">
                                <div>
                                    <a class="item-img" href='<%#"/ProductDetail.aspx?id={0}".StringFormat(Eval("ProductID")) %>'>
                                        <img src='<%# Eval("Avatar") %>' />
                                    </a>
                                </div>
                                <div class="text-left cart-info">
                                    <a class="item-name" href="#"><%# Eval("Title")%></a>
                                    <p class="item-price"><%# Eval("Price","{0:n0}đ") %></p>
                                    <div class="cart-btn">
                                        <asp:LinkButton runat="server" ID="LinkButton_Minus" ClientIDMode="AutoID"
                                            CommandArgument='<%# Eval("ProductID") %>'
                                            OnClick="LinkButton_Minus_Click"
                                            Text="-" class="btn btn-minicart" />
                                        <input class="input-quantity" readonly type="text" value='<%# Eval("Quantity") %>' />
                                        <asp:LinkButton runat="server" ID="LinkButton_Plus" ClientIDMode="AutoID"
                                            CommandArgument='<%# Eval("ProductID") %>'
                                            OnClick="LinkButton_Plus_Click"
                                            class="btn btn-minicart" Text="+" />
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton_Remove" ClientIDMode="AutoID" OnClick="LinkButton_Remove_Click"
                                    CommandArgument='<%# Eval("ProductID") %>'
                                    class="btn btn-delete">
                                        <i class="fa fa-times-circle"></i>
                                </asp:LinkButton>
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="subtotal">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>TỔNG TIỀN:<span class="sum_price" runat="server" id="span_Amount">0₫</span></ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="cart-link">
        <div class="link-cart">
            <a href="CheckOut.aspx"><i class="fas fa-money-bill-wave mr-2"></i><span>đặt hàng</span><i class="far fa-arrow-alt-right ml-2"></i></a>
        </div>

        <div class="link-cart">
            <a href="ShoppingCart.aspx"><i class="fas fa-shopping-cart mr-2"></i><span>giỏ hàng</span><i class="far fa-arrow-alt-right ml-2"></i></a>
        </div>
    </div>
</div>
