<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucProductHome.ascx.cs" Inherits="ucProductHome" %>

<!-- Rượu vang ý -->
<asp:Repeater runat="server" ID="Repeater_Main">
    <ItemTemplate>
        <div class="group" style="width: 80%; margin: auto;">
            <div class="MenuCoff">
                <h1>
                    <%# Eval("Title") %>
                </h1>

                <div class="directIcon">
                    <i class='fas fa-seedling' style='font-size: 36px'></i>
                </div>
            </div>
        </div>

        <section class="container animatedParent" data-sequence='500' id="product-list">
            <ul class="row animated bounceInRight slowest" data-id='3'>
                <asp:Repeater runat="server" ID="Repeater_ProductList" DataSource='<%# Eval("ProductList") %>'>
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
    </ItemTemplate>
</asp:Repeater>
