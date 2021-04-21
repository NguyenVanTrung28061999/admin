//History
$(function () {
    $('.history  .history-item > .nav-item:first-child > .nav-link').addClass('active');
    $('.history  .history-content > .history-content-item:first-child').addClass('show active');
    
});
//css aos animation
$(function () {
    AOS.init();
});
//menu-main fixed
$(function () {
    var menu = $('.menu-lg');
    var container = $('.menu-main .container');
    function isInViewport() {
        var viewportTop = $(window).scrollTop();
        if (viewportTop > 0) {
            menu.addClass('menu-lg-fixed');
            container.addClass('container-fixed');
        } else {
            menu.removeClass('menu-lg-fixed');
            container.removeClass('container-fixed');
        }
    }
    $(window).scroll(function () {
        isInViewport($('.menu-lg'));
    });

});
 //banner - main
$(function () {
    setTimeout(function () {

        $('.video-main ').css({
            'display': 'block'
        });
        $('.video-main video').css({
            'display': 'block'
        });
        $('.banner').css({
            'display': 'none'
        })
    }, 2000)
    setTimeout(function () {
        $('.video-main').css({
            'display': 'none'
        });
        $('.banner').css({
            'display': 'block'
        })
    }, 54000)
});
//slider-main
$(function () {
    var owl = $('.owl-carousel');
    owl.owlCarousel({
        loop: true,
        margin: 40,
        autoplay: true,
        autoplayTimeout: 1500,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 2,
                margin: 30

            },
            768: {
                items: 4

            },
            1024: {
                items: 5
            }
        }
    });
    $('.play').on('click', function () {
        owl.trigger('play.owl.autoplay', [1000])
    })
    $('.stop').on('click', function () {
        owl.trigger('stop.owl.autoplay')


    })

       

});



