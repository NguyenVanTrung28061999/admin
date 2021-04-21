<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang chủ  -Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard</a>
                </li>
            </ol>
            <div class="workplace">
                <div class="page-header">
                    <h2>Chào mừng đến với chương trình quản lý website.
                        <br />
                        Hãy chọn Menu để đến trang chức năng.
                    </h2>
                </div>
            </div>

        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

