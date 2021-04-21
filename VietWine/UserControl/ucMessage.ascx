<%@ Control Language="C#" AutoEventWireup="true" Inherits="CodeUtility.MessageUtility" %>

<div runat="server" id="SuccessBox" class="alert alert-success alert-dismissible">
    <button type="button" class="close" style="font-size: 3rem;outline:none" data-dismiss="alert">&times;</button>
    <span runat="server" id="SuccessMessage" class="message">Thông báo</span>
</div>

<div runat="server" id="ErrorBox" class="alert alert-danger alert-dismissible">
    <button type="button" style="font-size: 3rem;outline:none" class="close" data-dismiss="alert">&times;</button>
    <span runat="server" id="ErrorMessage">Thông báo</span>
</div>

