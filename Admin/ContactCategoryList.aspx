<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactCategoryList.aspx.cs" Inherits="ContactCategoryList" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Loại Thư Liên Hệ - Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="KnowledgeCategoryList.html">Loại Thư Liên Hệ </a>
                </li>
            </ol>

            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">LOẠI THƯ LIÊN HỆ
            </h4>
            <div class="row-fluid">
                <div class="span3 card mb-4">
                    <div class="card-header" style="cursor: pointer;">
                        <i class="far fa-folder"></i>
                        Loại Thư Liên Hệ
                    </div>
                    <div class="block-fluid">
                        <!--Loại Cấp Cha + Cấp Con-->
                        <!--Loại Cấp Cha-->
                        <!--Loại Cấp Con-->
                        <div class="row-form clearfix" style="padding: 8px 16px;">
                           <asp:ListBox ID="ListBox_List" runat="server"
                                OnSelectedIndexChanged="ListBox_List_SelectedIndexChanged"
                                AutoPostBack="true"
                                class="category" Style="height: 510px;" />
                            <span style="text-align: center; display: block;">Chọn Loại để xem.</span>
                        </div>

                    </div>
                </div>
                <div class="span9">
                    <div class="card mb-4">
                        <div class="card-header" style="cursor: pointer;">
                            <i class="fas fa-list-ul mr-1"></i>
                            Chi Tiết Loại Đang Chọn
                                    <a href="#" title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                        
                                    </a>
                             <asp:LinkButton runat="server" ID="LinkButton_Delete" 
                                                OnClientClick="return confirm('Bạn có chắc muốn xóa không?')"
                                                OnClick="LinkButton_Delete_Click"
                                                title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;" >
                                 <i class="fas fa-trash-alt mr-1"></i>
                             </asp:LinkButton>
                            <a href="ContactCategoryList.aspx" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                <i class="fas fa-plus-circle mr-1"></i>
                            </a>
                        </div>


                        <div class="block-fluid  customize">
                            <!--Chọn Loại Cấp Cha-->
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Loại Cấp Cha:
                                </div>
                                <div class="span7">
                                    <input type="text" />
                                    <span>Chọn Loại Cấp Cha của loại này.</span>
                                </div>
                            </div>
                            <!--Mã số + vị trí-->
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Mã Loại:
                                </div>
                                <div class="span1">
                                    <input runat="server" id="input_ID" type="text" class="tipb" readonly="readonly" title="Mã số tự động (không cần nhập)" />
                                </div>
                                <div class="span1">
                                    Vị trí:
                                </div>
                                <div class="span1" style="margin-left: 2px;">
                                    <input runat="server" id="input_Position" type="text" class="tipb" title="Dùng để sắp xếp thứ tự" />
                                </div>
                                <div class="span1">
                                    Code:
                                </div>
                                <div class="span1">
                                    <input runat="server" id="input_Code" type="text" class="tipb" title="Dùng để tìm kiếm hoặc phân loại" />
                                </div>
                                <div class="span3">
                                    <span>(Vị trí và Code: được phép để trống)</span>
                                </div>
                            </div>
                            <!--Tiêu đề-->
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Tiêu đề:
                                </div>
                                <div class="span7">
                                    <input runat="server" id="input_Title" type="text" />
                                    <span>VD: Tin bất động sản trong nước </span>
                                </div>
                            </div>
                            <!--Mô tả-->
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Mô tả:
                                </div>
                                <div class="span7">
                                    <textarea runat="server" id="textarea_Description" style="min-height: 50px; width: 100%;"></textarea>
                                    <span>Mô tả thêm. Phần mô tả sẽ hiển thị khi rê chuột vào tiêu đề Loại </span>
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
                                    <asp:FileUpload runat="server" ID="FileUpload_Avatar" class="skip" preview="avatar-preview" style="height: 30px;" />
                                    <br />
                                    <span>Hình đại diện cho loại tài khoản. Bạn có thể upload hình mới nếu muốn.
                                                Các Loại file hỗ trợ: *.jpg, *.jpeg, *.gif, *.png
                                    </span>
                                </div>
                            </div>
                            <!--Trạng thái-->
                            <div class="row-form clearfix">
                                <div class="span2">
                                    Trạng thái:
                                </div>
                                <div class="span7">
                                    <label class="checkbox inline">
                                        <input runat="server" id="radio_StatusYes" name="status" type="radio" checked />
                                        Cho phép hiển thị
                                    </label>
                                    <label class="checkbox inline">
                                        <input runat="server" id="radio_StatusNo" name="status" type="radio" />
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
                </div>
            </div>
            <!--Lưu-->
            <div class="tar">
                <asp:LinkButton runat="server" ID="LinkButton_Save"
                    OnClick="LinkButton_Save_Click" class="btn btn-success">
                                    <i class="fas fa-save"></i>
                    Lưu
                </asp:LinkButton>
            </div>

        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

