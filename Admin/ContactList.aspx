<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="ContactList" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sách thư liên hệ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="container-fluid">
            <ol class="breadcrumb mb-4" style="cursor: pointer;">
                <li class="breadcrumb-item active">
                    <a href="Default.html">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">
                    <a href="ContactList.html">Danh Sách Thư Liên Hệ</a>
                </li>
            </ol>
            <h4 style="text-align: center; font-size: 30px; margin-top: 10px; color: #747506;">DANH SÁCH THƯ LIÊN HỆ
            </h4>
            <div class="card mb-4">
                <div class="card-header" style="cursor: pointer;">
                    <i class="fas fa-list-ul mr-1"></i>
                    Danh Sách Thư Liên Hệ
                            <a href="#" title="Xóa chọn" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
                                <i class="fas fa-trash-alt mr-1"></i>
                            </a>
                    <a href="KnowledgeEdit.html" title="Thêm mới" style="float: right; margin: 0px 8px 7px 10px; font-size: 20px;">
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
                                        <th width="15px" class="center">
                                            <input type="checkbox" name="checkall" />
                                        </th>
                                        <th>Nội dung liên hệ 
                                        </th>
                                        <th width="70px">Ngày Đặt
                                        </th>
                                        <th>Thông tin liên hệ
                                        </th>
                                        <th>Người duyệt
                                        </th>
                                        <th width="200px">Cập nhật trạng thái / Xóa
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
                                                <td>Mã thư liên hệ: <b><b><%# Eval("ContactID") %></b></b>
                                                    <br>
                                                    Nội dung liên hệ:
                                                <b><%# Eval("Content") %></b>
                                                    <br>
                                                </td>
                                                <td><%# Eval("CreateTime", "{0:dd/MM/yyyy<br/>HH:mm:ss}") %>
                                                </td>
                                                <td>
                                                    <%# Eval("FullName") %>
                                                    <br />
                                                    <%# Eval("Mobile") %>
                                                    <br />
                                                    <%# Eval("Email") %>
                                                </td>
                                                <td><%# Eval("CreateBy") %>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton_Delete" runat="server"
                                                        OnClick="LinkButton_Delete_Click"
                                                        OnClientClick="return confirm('Bạn có chắc muốn xóa không?');"
                                                        CommandArgument='<%# Eval("ContactID") %>'
                                                        class="btn btn-danger tip" Style="color: #f8f9fa; width: 100%;">
                                                        <span class="fas fa-trash-alt mr-1"></span>Xóa dữ liệu này
                                                    </asp:LinkButton>
                                                   
                                                    <asp:LinkButton ID="LinkButton_Status" runat="server"
                                                        OnClick="LinkButton_Status_Click"
                                                        CommandArgument='<%# Eval("ContactID") %>' style="color: #f8f9fa; width: 100%;"
                                                        class='<%# Eval("Status").ToBool() == true ? "btn  btn-success tip" : "btn btn-danger tip" %>'>
                                                        <span class='<%# Eval("Status").ToBool() == true ? "fas fa-lock mr-1" : "icon-lock icon-white" %>'></span>
                                                        <%# Eval("Status").ToBool() == true ? "Thư đã đọc, Đánh dấu lại" : "Thư chưa đọc, Đánh dấu lại" %>
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <!--Chưa có dữ liệu-->
                                <tr runat="server" id="tr_EmptyData" visible="false">
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

