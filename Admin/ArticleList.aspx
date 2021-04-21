<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="ArticleList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh Sách Tin Tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4" style="cursor: pointer;">
                <li class="breadcrumb-item active">
                    <a href="/">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="ArticleCategoryList.aspx">Loại Tin Tức</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="ArticleList.aspx">Danh Sách Tin Tức</a>
                </li>
            </ol>
            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">DANH SÁCH TIN TỨC
            </h4>
            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-list-ul mr-1"></i>
                    Danh Sách Tin Tức
                    <a href="#" Style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;" title="Xóa chọn" onclick="alert('Chức năng xóa hàng loạt này hiện chưa có.')"><i class="fas fa-trash-alt mr-1"></i></a>
                    <a href="ArticleEdit.aspx" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                        <i class="fas fa-plus-circle mr-1"></i>
                    </a>
                </div>

                <div class="customize" style="height: auto; margin-top: 15px;">
                    <div class="span7">
                        <div class="row-form clearfix span3" style="height: 60px; margin-left: -1px;">
                            <asp:DropDownList runat="server" ID="DropDownList_Category" OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="span4 clearfix">
                            <div class="input-group">
                                <input runat="server" id="input_Keyword" class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" style="height: 37px;" />
                                <asp:LinkButton runat="server" ID="LinkButton_Search" OnClick="LinkButton_Search_Click" class="btn btn-primary" Style="margin-top: -1px; height: 37px;">
                                    <i class="fas fa-search"></i>&nbsp;
                                </asp:LinkButton>
                            </div>

                        </div>
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
                                    <th width="16px" class="center">
                                        <input type="checkbox" name="checkall" />
                                    </th>
                                    <th width="230px" class="center" style="text-align: center;">Hình
                                    </th>
                                    <th width="50px" class="center">ID
                                    </th>
                                    <th style="text-align: center;">Tiêu đề / Lưọt Xem / Mô tả
                                    </th>
                                    <th style="text-align: center;">Tác Giả /Ngày
                                    </th>
                                    <th width="200px" class="center" style="text-align: center;">Cập nhật trạng thái / Xóa
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="Repeater_Main" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="checkbox" />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("Avatar") %>' class="fancybox lightbox-preview" rel="group" title="">
                                                    <img src='<%# Eval("Avatar") %>' alt="avatar" style="width: auto; height: 200px; margin-bottom: 2px;" class="default-image img-polaroid avatar-preview-793" original="~/admin/img/hinh2.jpg" />
                                                </a>
                                            </td>
                                            <td><%# Eval("ArticleID") %>
                                            </td>
                                            <td>
                                                <h5><%# Eval("Title") %>
                                                </h5>

                                                <p>Loại: <b><%#Eval("MainCatTitle") %>- <%#Eval("CatTitle") %></b></p>
                                                <p align="justify">
                                                    <%#Eval("Title") %>
                                                </p>
                                            </td>
                                            <td>
                                                <h5><%#Eval("CreateBy")%></h5>
                                                <br />
                                                <%#Eval("CreateTime","{0:dd/MM/yyyy <br/> HH:mm:ss}")%><br />
                                            </td>
                                            <td>
                                                <a href='<%# Eval("ArticleID", "ArticleEdit.aspx?id={0}") %>' class="btn  btn-warning tip" style="color: #f8f9fa; width: 100%;">
                                                    Chỉnh Sửa Thông Tin
                                                </a>
                                               
                                                 <asp:LinkButton ID="LinkButton_Delete" runat="server"
                                                        OnClick="LinkButton_Delete_Click1"
                                                        OnClientClick="return confirm('Bạn có chắc muốn xóa không?');"
                                                        CommandArgument='<%# Eval("ArticleID") %>'
                                                        class="btn btn-danger tip" style="color: #f8f9fa; width: 100%;">
                                                       Xóa dữ liệu này
                                                    </asp:LinkButton>

                                               <asp:LinkButton runat="server" ID="LinkButton_Status" 
                                                   OnClick="LinkButton_Status_Click"
                                                    CommandArgument='<%# Eval("ArticleID") %>'
                                                    class='<%# Eval("Status").ToBool() == true ? "btn btn-success tip" : "btn btn-danger tip" %>'>
                                                    <span class='<%# Eval("Status").ToBool() == true ? "icon-ok icon-white" : "icon-lock icon-white" %>'></span>
                                                     <%# Eval("Status").ToBool() == true ? "Đang kích hoạt, Tạm khóa lại" : "Đang tạm khóa, Kích hoạt lại" %>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                 <!--Chưa có dữ liệu-->
                                <tr id="tr_EmptyData" runat="server" visible="false">
                                    <td colspan="7">
                                        <center>Chưa có dữ liệu</center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <uc1:ucPagging runat="server" ID="ucPagging" />
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

