<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="ProductEdit" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sửa Thông Tin Sản Phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4" style="cursor: pointer; font-size: 13px;">

                <li class="breadcrumb-item active">
                    <a href="/">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="ProductList.aspx">Danh Sách Sản Phẩm</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="ProductEdit.aspx">Chỉnh Sửa & Thêm Mới Sản Phẩm</a>
                </li>

            </ol>

            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">THÊM / CHỈNH SỬA SẢN PHẨM
            </h4>

            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-list-ul mr-1"></i>
                    Đăng / Cập Nhật Sản Phẩm
                </div>
                <div class="block-fluid  customize">
                    <div class="row-form clearfix">
                        <h5>Thông tin cơ bản
                        </h5>
                    </div>
                    <div class="row-form clearfix">
                        <div class="span2">
                            Loại danh mục:
                           
                        </div>
                        <div class="span7">
                            <asp:DropDownList runat="server" ID="DropDownList_Category" />
                                        <span>Chọn Loại Cấp Cha của loại này.</span>
                        </div>
                    </div>
                    <div class="row-form clearfix">
                        <div class="span2">
                            Mã số:
                           
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
                            <span>Tiêu đề của bài báo. Nhập ngắn gọn, thể hiện đúng nội dung chính.</span>
                        </div>
                    </div>
                      <div class="row-form clearfix">
                                    <div class="span2">
                                        Giá bán:
                                    </div>
                                    <div class="span2">
                                        <input runat="server" id="input_Price" type="text" class="tipb" />
                                    </div>
                                    <div class="span1">
                                        Giá cũ:
                                    </div>
                                    <div class="span2"">
                                        <input runat="server" id="input_OldPrice" type="text" class="tipb"/>
                                    </div>
                                    <div class="span1">
                                        Số lượng:
                                    </div>
                                    <div class="span1">
                                        <input runat="server" id="input_Quantity" type="text" class="tipb"/>
                                    </div>
                                </div>
                     <!--Tiêu đề-->
                    <div class="row-form clearfix">
                        <div class="span2">
                            Tiêu đề thông tin:
                           
                        </div>
                        <div class="span7">
                            <input runat="server" id="input_TitleInfo" type="text" />
                            <span>Tiêu đề của bài báo. Nhập ngắn gọn, thể hiện đúng nội dung chính.</span>
                        </div>
                    </div>
                    <!--Mô tả-->
                    <div class="row-form clearfix">
                        <div class="span2">
                            Mô tả:
                           
                        </div>
                        <div class="span7">
                            <textarea runat="server" id="textarea_Description" style="min-height: 100px; width: 100%;"></textarea>
                            <span>Tóm tắt ngắn gọn nội dung của bài báo.</span>
                        </div>
                    </div>
                    <!--Hình đại diện-->
                    <div class="row-form clearfix">
                        <div class="span2">
                            Hình đại diện:
                           
                        </div>
                        <div class="span7">

                            <a href="../css/img/no_image.jpg" runat="server" id="a_Avatar" class="fancybox lightbox-preview" rel="group">
                                            <img src="../css/img/no_image.jpg" runat="server" id="img_Avatar" alt="avatar" class="default-image img-polaroid avatar-preview" style="width: 180px; height: 135px;" />
                                        </a>
                                        <br />
                                        <asp:FileUpload runat="server" ID="FileUpload_Avatar" class="skip" preview="avatar-preview" />
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

