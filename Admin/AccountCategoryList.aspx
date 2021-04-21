<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountCategoryList.aspx.cs" Inherits="AccountCategoryList" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Loại Tài Khoản - Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4" style="cursor: pointer;">
                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="AccountCategoryList.html">Loại Tài Khoản</a>
                </li>
            </ol>

            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">LOẠI TÀI KHOẢN
            </h4>
            <div class="row-fluid">
                <div class="span3 card mb-4">
                    <div class="card-header" style="cursor: pointer;">
                        <i class="far fa-folder"></i>
                        Danh Sách Loại Tài Khoản
                    </div>
                    <div class="block-fluid">
                        <div class="row-form clearfix">
                            <asp:ListBox ID="ListBox_List" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ListBox_List_SelectedIndexChanged"
                                size="4" class="category" Style="height: 568px;" />
                        </div>
                    </div>
                </div>
                <div class="span9">
                    <div class="card mb-4">
                        <div class="card-header" style="cursor: pointer;">
                            <i class="fas fa-list-ul mr-1"></i>
                            Chi Tiết Tài Khoản
                                  
                            <asp:LinkButton runat="server" ID="LinkButton_Delete"
                                OnClientClick="return confirm('Bạn có chắc muốn xóa không?')"
                                OnClick="LinkButton_Delete_Click" title="Xóa chọn"
                                Style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;"> <i class="fas fa-trash-alt mr-1"></i></asp:LinkButton>
                            <a href="AccountEdit.html" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                <i class="fas fa-plus-circle mr-1"></i>
                            </a>
                        </div>


                        <div class="block-fluid  customize">
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Mã tài khoản:
                                </div>
                                <div class="span5">
                                    <input runat="server" id="input_ID" type="text" class="tip" />
                                    <span>Sử dụng chữ cái (hoặc thêm số). Không gõ dấu và không khoảng trắng. VD: SupperAdmin</span>
                                </div>
                                <div class="span1">
                                    Vị trí:
                                </div>
                                <div class="span2" style="float: right;">
                                    <input runat="server" id="input_Position" type="text" class="tipb" title="Dùng để sắp xếp thứ tự" />
                                    <span>Nhập số hoặc để trống</span>
                                </div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Tiêu đề:
                                </div>
                                <div class="span7">
                                    <input runat="server" id="input_Title" type="text" />
                                    <span>VD: Quản trị cao cấp, quản trị viên, ...</span>
                                </div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Mô tả:
                                </div>
                                <div class="span7">
                                    <textarea runat="server" id="textarea_Description" style="min-height: 50px; width: 100%;"></textarea>
                                    <span>Nên mô tả chi tiết về các quyền hoặc các giới hạn của loại tài khoản này.</span>
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
                                    <asp:FileUpload runat="server" ID="FileUpload_Avatar"
                                        class="skip" preview="avatar-preview" Style="height: 30px;" />
                                    <br />
                                    <span>Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                                Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                    </span>
                                </div>
                            </div>
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Trạng thái:
                                </div>
                                <div class="span7">
                                    <label class="checkbox inline">
                                        <input runat="server" name="status" id="radio_StatusYes" type="radio" checked />
                                        Hiển thị
                                    </label>
                                    <label class="checkbox inline">
                                        <input runat="server" name="status" id="radio_StatusNo" type="radio" />
                                        Tạm ẩn
                                    </label>
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
                    <!--Lưu-->
                    <div class="tar">
                        <asp:LinkButton runat="server" ID="LinkButton_Save"
                            OnClick="LinkButton_Save_Click" class="btn btn-success">
                                    <i class="fas fa-save"></i> Lưu
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

