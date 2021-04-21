function loginRedirectToDefault() {
    //Đăng nhập thành công, đang chuyển đến trang chủ....

    var count = 5;
    setInterval(function () {
        $(".message").html("Đăng nhập thành công, đang chuyển đến trang chủ...." + count + " s...");
        count--;

        if (count == 0) {
            location.href = '/Admin/Default.aspx'
        }
    }, 1000); 

}