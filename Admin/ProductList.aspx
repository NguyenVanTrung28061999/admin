<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sách sản phẩm </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">

            <ol class="breadcrumb mb-4" style="cursor: pointer;">
                <li class="breadcrumb-item active">
                    <a href="Default.aspx">Dashboard </a>

                </li>
                <li class="breadcrumb-item active">
                    <a href="ProductCategoryList.aspx">Loại Sản Phẩm </a>

                </li>
                <li class="breadcrumb-item active">
                    <a href="ProductList.aspx">Danh Sách Sản Phẩm </a>

                </li>
            </ol>
            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">DANH SÁCH SẢN PHẨM
            </h4>
            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-list-ul mr-1"></i>
                    Danh Sách Tin Tức
                            <a href="#" title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                <i class="fas fa-trash-alt mr-1"></i>
                            </a>
                    <a href="ProductEdit.aspx" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                        <i class="fas fa-plus-circle mr-1"></i>
                    </a>
                </div>
                <div class="customize" style="height: auto; margin-top: 15px;">
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
                                    <th width="16px" class="center">
                                        <input type="checkbox" name="checkall" />
                                    </th>
                                    <th width="190px" class="center" style="text-align: center;">Hình
                                    </th>
                                    <th width="65px" class="center">Mã Số
                                    </th>
                                    <th style="text-align: center;">Tiêu đề /Loại
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
                                                    <img src='<%# Eval("Avatar") %>' alt="avatar" style="width: auto; height: 150px; margin-bottom: 2px;" class="default-image img-polaroid avatar-preview-793" original="~/admin/img/Product/h5.jpg" />
                                                </a>
                                            </td>
                                            <td> <%# Eval("ProductID") %>
                                            </td>
                                            <td>
                                                <h5> <%# Eval("CatTitle") %>
                                                </h5>

                                                <p>Loại: <b><%# Eval("MainCatTitle") %></b></p>
                                            </td>
                                            <td>
                                                <h5><%# Eval("CreateBy") %></h5>
                                                <br />
                                                <%# Eval("CreateTime", "{0:dd/MM/yyyy <br /> HH:mm:ss}") %><br />
                                            </td>
                                            <td>
                                               <a class="btn  btn-warning tip" style="color: #f8f9fa; width: 100%;" href='<%# Eval("ProductID","ProductEdit.aspx?id={0}") %>'>Chỉnh Sửa Thông Tin
                                                </a>
                                                <asp:LinkButton ID="LinkButton_Delete" runat="server"
                                                    OnClick="LinkButton_Delete_Click" OnClientClick=" return confirm('Bạn có chắc muốn xóa không?');"
                                                    CommandArgument='<%# Eval("ProductID") %>'
                                                    class="btn btn-danger tip" Style="color: #f8f9fa; width: 100%;">Xóa Dữ Liệu Này
                                                </asp:LinkButton>

                                                <asp:LinkButton ID="LinkButton_Status" runat="server"
                                                    OnClick="LinkButton_Status_Click"
                                                    CommandArgument='<%# Eval("ProductID") %>'
                                                    class='<%# Eval("Status").ToBool() == true ? "btn btn-success tip" : "btn btn-danger tip" %>'
                                                    Style="color: #f8f9fa; width: 100%;">
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

