<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountEdit.aspx.cs" Inherits="AccountEdit" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sửa Tài Khoản - Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">
                    <a href="Default.aspx">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountCategoryList.aspx">Loại Tài Khoản</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountList.aspx">Danh Sách Tài Khoản</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountEdit.aspx">Thông Tin Tài Khoản</a>
                </li>
            </ol>
            <h5 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506; font-family: Cambria,Georgia,serif;">THÊM / CHỈNH SỬA THÔNG TIN TÀI KHOẢN
            </h5>
            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-table mr-1"></i>
                    Thông Tin Đăng Nhập
                            <a href="#" title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                <i class="fas fa-trash-alt mr-1"></i>
                            </a>
                    <a href="AccountEdit.aspx" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                        <i class="fas fa-plus-circle mr-1"></i>
                    </a>
                </div>
            </div>
            <div class="block-fluid  customize">

                <div class="row-form clearfix">
                    <div class="span2">
                        Chọn Loại Tài Khoản:
                    </div>
                    <div class="span2">
                        <asp:DropDownList ID="DropDownList_Category" runat="server" />
                    </div>
                    <div class="span6">
                        <span>Chọn tài khoản.</span>
                    </div>
                </div>
                <!--Username-->
                <div class="row-form clearfix">
                    <div class="span2">
                        Tên đăng nhập:
                    </div>
                    <div class="span2">
                        <input runat="server" id="input_Username" type="text" class="tipb" />
                    </div>
                    <div class="span6">
                        <span>Tên đăng nhập không chứa dấu, không cách và không ký hiệu đặc biệt như: !@#$%^&*...</span>
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
                        <span runat="server" id="span_PasswordInfo" visible="false">Để trống nếu không cần đổi password.</span>
                    </div>
                </div>

                <!--Trạng thái-->
                <div class="row-form clearfix">
                    <div class="span2">
                        Trạng thái:
                    </div>
                    <div class="span7">
                        <label class="checkbox inline">
                            <input runat="server" name="status" id="radio_StatusYes" type="radio" checked />
                            Kích hoạt
                        </label>
                        <label class="checkbox inline">
                            <input runat="server" name="status" id="radio_StatusNo" type="radio" />
                            Tạm khóa
                        </label>
                    </div>
                </div>

                <!--Họ tên-->
                <div class="row-form clearfix">
                    <div class="span2">
                        Họ tên:
                    </div>
                    <div class="span4">
                        <input runat="server" id="input_FullName" type="text" />
                    </div>
                    <div class="span4">
                        <span>Nhập họ tên đầy đủ của tài khoản. Gõ tiếng Việt có dấu. VD: Nguyễn Văn Trung</span>
                    </div>
                </div>

                <!--Email-->
                <div class="row-form clearfix">
                    <div class="span2">
                        Email:
                    </div>
                    <div class="span3">
                        <input runat="server" id="input_Email" type="text" />
                    </div>
                    <div class="span5">
                        <span>Email dùng để liên lạc hoặc nhận lại mật khẩu (nếu bị mất).
                                    VD: itpro@123.com
                        </span>
                    </div>
                </div>

                <div class="account-contact-info">
                    <div>
                        <!--Số điện thoại-->
                        <div class="row-form clearfix">
                            <div class="span2">
                                Số điện thoại:
                            </div>
                            <div class="span4">
                                <input runat="server" id="input_Mobile" type="text" />
                            </div>
                            <div class="span4">
                                <span>Số điện thoại liên lạc của tài khoản. VD: 098 456 789
                                </span>
                            </div>
                        </div>


                        <!--Hình đại diện-->
                        <div class="row-form clearfix">
                            <div class="span2">
                                Hình đại diện:
                            </div>
                            <div class="span7">
                                <a href="/admin/img/no_image.png" runat="server" id="a_Avatar" class="fancybox lightbox-preview" rel="group">
                                    <img src="/admin/img/no_image.png" runat="server" id="img_Avatar" alt="avatar" class="default-image img-polaroid avatar-preview" style="width: 180px; height: 135px;" />
                                </a>
                                <br />

                                <asp:FileUpload runat="server" ID="FileUpload_Avatar" class="skip" preview="avatar-preview" Style="height: 30px;" />
                                <br />
                                <span>Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                            Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                </span>
                            </div>
                        </div>

                        <!--Giới tính-->
                        <div class="row-form clearfix">
                            <div class="span2">
                                Giới tính:
                            </div>
                            <div class="span7">
                                <label class="checkbox inline">
                                    <input runat="server" name="gender" id="radio_GenderMale" type="radio" checked />
                                    Nam
                                </label>
                                <label class="checkbox inline">
                                    <input runat="server" name="gender" id="radio_GenderFemale" type="radio" />
                                    Nữ
                                </label>
                            </div>
                        </div>
                        <!--Địa chỉ-->
                        <div class="row-form clearfix">
                            <div class="span2">
                                Địa chỉ liên hệ:
                            </div>
                            <div class="span7">
                                <textarea runat="server" id="textarea_Address"></textarea>
                                <span>Bạn có thể nhập địa chỉ nhà hoặc tên phòng ban nơi tài khoản làm việc hoặc thông tin mô tả thêm...</span>
                            </div>
                        </div>
                        <!-- Thông báo -->
                        <div class="row-form clearfix">
                            <div class="span2">
                            </div>
                            <div class="span7">
                                <uc1:ucMessage runat="server" ID="ucMessage" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--Lưu-->
            <div class="tar">
                <asp:LinkButton runat="server" ID="LinkButton_Save" OnClick="LinkButton_Save_Click" class="btn btn-success">
                                    <i class="fas fa-save"></i>Lưu
                </asp:LinkButton>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

