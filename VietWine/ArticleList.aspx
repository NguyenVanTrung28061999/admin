<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="ArticleList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Danh sách tin tức - VietWine</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <!-- article-list -->
    <div class="group" style="width: 80%; margin: auto;">
        <div class="MenuCoff">
            <h1>TIN TỨC</h1>
            <div class="directIcon">
                <i class='fas fa-seedling' style='font-size:36px'></i>
            </div>
        </div>
    </div>
    <section class="containre-list article-list">
        <div class="container p-lg-0">
            <div class="row">
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-lg-4 list-item">
                             <a class="box-list-item" href='<%# "/ArticleDetail.aspx?id={0}".StringFormat(Eval("ArticleID")) %>'>
                                <div class="img">
                                    <img class="img-fluid" src='<%# Eval("Avatar") %>' />
                                </div>
                                <div class="content">
                                    <h4><%# Eval("Title") %></h4>
                                    <div class="text-content">
                                        <%# Eval("Description").Left(150, true,true) %>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
               
            </div>

        </div>
    </section>
    <!-- Paging -->
    <uc1:ucPagging runat="server" ID="ucPagging" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

