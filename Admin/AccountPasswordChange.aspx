<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountPasswordChange.aspx.cs" Inherits="AccountPasswordChange" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Đổi mật khẩu tài khoản</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4">

                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountPasswordChange.html">Đổi Mật Khẩu</a>
                </li>
            </ol>
            <h5 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">ĐỔI MẬT KHẨU
            </h5>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-list-ul"></i>
                    Mời Nhập Mật Khẩu Mới
                </div>

                <div class="block-fluid  customize">


                    <div class="row-form clearfix">
                        <div class="span2">
                            Tên đăng nhập:
                        </div>
                        <div class="span2">
                            <input runat="server" id="input_Username" type="text" class="tipb" />
                        </div>
                        <div class="span6">
                            <span>Bạn đang thay đổi mật khẩu cho tài khoản này</span>
                        </div>
                    </div>

                    <!--Mật khẩu-->
                    <div class="row-form clearfix">
                        <div class="span2">
                            Mật khẩu:
                        </div>
                        <div class="span2">
                            <input runat="server" id="input_Password" type="password" />
                        </div>
                        <div class="span6">
                            <span>Vui lòng nhập mật khẩu.</span>

                        </div>
                    </div>
                    <div class="row-form clearfix">
                        <div class="span2">
                            Nhập lại:
                        </div>
                        <div class="span2">
                            <input runat="server" id="input_Repassword" type="password" />
                        </div>
                        <div class="span6">
                            <span>Mật khẩu lần 2 giống mật khẩu lần 1.</span>

                        </div>
                    </div>
                    <div class="row-form clearfix">
                        <div class="span2">
                        </div>
                        <div class="span7">
                            <uc1:ucMessage runat="server" ID="ucMessage" />
                        </div>
                    </div>
                </div>
            </div>
            <!--Lưu-->
            <div class="tar">
                <asp:LinkButton runat="server" ID="LinkButton_Save" OnClick="LinkButton_Save_Click" class="btn btn-success">
                                    <i class="fas fa-save"></i>
                    Lưu
                </asp:LinkButton>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

