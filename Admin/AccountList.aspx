<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountList.aspx.cs" Inherits="AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sách tài khoản - Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">

            <ol class="breadcrumb mb-4" style="cursor: pointer;">
                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard </a>

                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountCategoryList.html">Loại Tài Khoản</a>

                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountList.html">Danh Sách Tài Khoản</a>
                </li>
            </ol>
            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">QUẢN LÝ TÀI KHOẢN
            </h4>
            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-table mr-1"></i>
                    Danh Sách Tài Khoản
                           
                    <a href="#" title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                        <i class="fas fa-trash-alt mr-1"></i>
                    </a>
                    <a href="AccountEdit.aspx" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                        <i class="fas fa-plus-circle mr-1"></i>
                    </a>
                </div>
                <div class="customize" style="height: auto; margin-top: 15px; margin-bottom: 2px;">
                    <div class="span7">
                        <asp:Panel runat="server" DefaultButton="LinkButton_Search">
                            <div class=" span3 row-form clearfix " style="height: 50px; margin-left: -1px;">
                                <asp:DropDownList runat="server" ID="DropDownList_Category" OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                            <div class="span4 clearfix">
                                <div class="input-group">
                                    <input runat="server" id="input_Keyword" class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" style="height: 37px;" />
                                    <asp:LinkButton runat="server" ID="LinkButton_Search" OnClick="LinkButton_Search_Click" class="btn btn-primary" Style="margin-top: -1px; height: 37px;">
                                    <i class="fas fa-search"></i>&nbsp;
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="span3">
                        <asp:LinkButton runat="server" ID="LinkButton_ClearSearch" OnClick="LinkButton_ClearSearch_Click" class="btn btn-small btn-danger" Style="margin-top: -1px; width: 150px; float: right; height: 37px;">
                            <i class="fas fa-window-close"></i>
                            Hủy bộ lọc
                        </asp:LinkButton>
                    </div>

                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead style="font-size: 13px">
                                <tr>
                                    <th width="15px" class="center">STT
                                    </th>
                                    <th width="200px" class="center" style="text-align: center;">Hình
                                    </th>
                                    <th class="center" style="text-align: center;">Thông Tin Cá Nhân
                                    </th>
                                    <th style="text-align: center;">Chức Danh
                                    </th>

                                    <th width="200px" class="center" style="text-align: center;">Cập nhật trạng thái / Xóa
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="Repeater_Main" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>1
                                            </td>
                                            <td>
                                                <a href='<%# Eval("Avatar") %>' class="fancybox lightbox-preview" rel="group">
                                                    <img src='<%# Eval("Avatar") %>' alt="avatar" style="width: 150px; height: 150px; margin-bottom: 2px;" class="default-image img-polaroid avatar-preview-793" />
                                                </a>
                                            </td>
                                            <td>
                                                <a href='<%# Eval("Username", "/Admin/AccountEdit.aspx?id={0}") %>' class="account">
                                                    <%# Eval("FullName") %>
                                                </a>
                                                <p class="about">
                                                    <span class="fas fa-user" title="Username"></span>
                                                    <%# Eval("Username") %>

                                                    <br />
                                                    <span class="fas fa-envelope" title="Email"></span>
                                                    <%# Eval("Email") %>

                                                    <br />
                                                    <span class="fas fa-clock" title="Ngày khởi tạo tài khoản"></span>
                                                    <%# Eval("CreateTime", "{0:dd/MM/yyyy}") %>

                                                    <br />
                                                    <span class="fas fa-phone" title="Số điện thoại"></span>
                                                    <%# Eval("Mobile") %>

                                                    <br />
                                                    <span class="fas fa-home" title="Địa chỉ"></span>
                                                    <%# Eval("Address") %>

                                                    <br />
                                                    <span class="fas fa-adjust" title="Phái"></span>
                                                    <%# Eval("Gender").ToBool() == true ? "Nam" : "Nữ" %>

                                                    <br />
                                                </p>
                                            </td>
                                            <td>
                                                <p class="about">
                                                    <span class="tip icon-warning-sign" title="Vai trò"></span>
                                                    <%# Eval("AccountCategoryID") %>

                                                    <br />
                                                </p>
                                            </td>
                                            <td>
                                                <a href='<%# Eval("Username", "AccountPasswordChange.aspx?id={0}") %>' class="btn btn-primary tip" style="color: #f8f9fa; width: 100%;">Đổi Mật Khẩu
                                                </a>
                                                <a href='<%# Eval("Username", "AccountEdit.aspx?id={0}") %>' class="btn  btn-warning tip" style="color: #f8f9fa; width: 100%;">Chỉnh Sửa Thông Tin
                                                </a>
                                                <asp:LinkButton runat="server" OnClientClick="return confirm('Bạn có chắc muốn xóa không?');"
                                                    CommandArgument='<%# Eval("Username") %>' ID="LinkButton_Delete" OnClick="LinkButton_Delete_Click" class="btn btn-danger tip" Style="color: #f8f9fa; width: 100%;">Xóa Dữ Liệu Này
                                                </asp:LinkButton>

                                                <asp:LinkButton runat="server" ID="LinkButton_Status" OnClick="LinkButton_Status_Click"
                                                    CommandArgument='<%# Eval("Username") %>'
                                                    class='<%# Eval("Status").ToBool() == true ? "btn btn-success tip" : "btn btn-danger tip" %>' Style="color: #f8f9fa; width: 100%;">
                                                    <span class='<%# Eval("Status").ToBool() == true ? "icon-ok icon-white" : "icon-lock icon-white" %>'></span>
                                                     <%# Eval("Status").ToBool() == true ? "Đang kích hoạt, Tạm khóa lại" : "Đang tạm khóa, Kích hoạt lại" %>
                                                </asp:LinkButton>

                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

