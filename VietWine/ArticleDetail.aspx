<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleDetail.aspx.cs" Inherits="ArticleDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chi tiết tin tức - ViewWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <!-- article-detail -->
    <section class="containre-list article-detail">
        <div class="container p-lg-0">
            <div class="row">
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>
                        <h1 class="title col-12"><%# Eval("Title") %></h1>
                        <div class=" col-md-8 col-lg-9 detail-content">
                            <div class="mb-3">
                                <img src='<%# Eval("Avatar") %>' class="w-100 article-avt" />
                            </div>
                            <%# Eval("Content") %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-12 col-md-4 col-lg-3 detail-category">
                    <div class="box-left">
                        <h6 class="text-uppercase">Bài đăng mới </h6>
                        <ul class="list-unstyled text-justify">
                            <asp:Repeater ID="Repeater_Article" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <img src='<%# Eval("Avatar") %>' class="img mr-2 mt-2" />
                                        <div class="w-100 mt-0">
                                            <p class="mt-0 mb-2 item-detail-category">
                                                <a href='<%# "/ArticleDetail.aspx?id={0}".StringFormat(Eval("ArticleID")) %>'><%# Eval("Title").Left(40, true,true) %></a>
                                            </p>
                                            <p class="d-flex justify-content-between">
                                                <i class="fa fa-calendar">&nbsp;<span><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></span></i>
                                            </p>
                                        </div>

                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

