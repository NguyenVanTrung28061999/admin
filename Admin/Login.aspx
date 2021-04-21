<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
   <title>Login-Admin</title>
    <link href="admin/css/styles.css" rel="stylesheet" />
    <script>
        function loginRedirectToDefault() {
            var count = 5;
            setInterval(function () {
                $(".message").html("Đăng nhập thành công, đang chuyển đến trang chủ sau " + count + " s...");
                count--;

                if (count == 0) {
                    location.href = '/Default.aspx'
                }
            }, 1000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4">Đăng nhập hệ thống</h3>
                                    </div>
                                    <div class="card-body">
                                        <uc1:ucMessage runat="server" ID="ucMessage" />
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Tài Khoản</label>
                                            <input class="form-control py-4" runat="server" id="input_Username" onkeyup="searchUser(event)" type="text" placeholder="Nhập tài khoản " />
                                            <span class="text-danger" id="messageCheck"></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputPassword">Mật khẩu</label>
                                            <input class="form-control py-4" runat="server" id="input_Password" type="password" placeholder="Nhập mặt khẩu" />
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                <label class="custom-control-label" for="rememberPasswordCheck">Nhớ mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <a class="small" href="#">Forgot Password?</a>
                                            <asp:Button class="btn btn-primary" Text="Đăng nhập" runat="server" ID="Button_Login" OnClick="Button_Login_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Your Website Viet Y Wine 2021</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </form>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="src/js/jquery-3.1.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <script>
        var timer = null;
        $('#input_Username').keyup(function () {
            clearTimeout(timer);
            timer = setTimeout(doStuff, 500)
        });

        function doStuff() {
            //debugger;
            var value = $("#input_Username").val();
            $.ajax({
                type: "POST",
                url: '/CheckUserNameService.asmx/SearchUser',
                data: '{ "username": "' + value + '"}',
                contentType: "application/json",
                dataType: 'json',
                success: function (res) {
                    console.log(res);
                    $("#messageCheck").html(res.d);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }

        function searchUser(e) {
            e.preventDefault();

        }

    </script>
</body>
</html>
