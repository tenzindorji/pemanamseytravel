//========================
//NAVBAR
//========================
$(document).ready(function () {
    $('#status').fadeOut(); // will first fade out the loading animation
    // will fade out the white DIV that covers the website.
    $('#preloader').delay(350).fadeOut('slow');
    $('body').delay(350).css({'overflow': 'visible'});

    // hide .navbar first
    $(".navbar").hide();

    // fade in .navbar
    $(function () {
        $(window).scroll(function () {

            // set distance user needs to scroll before we start fadeIn
            if ($(this).scrollTop() > 40) {
                $('.navbar')
                    .removeClass('animated fadeOutUp')
                    .addClass('animated fadeInDown')
                    .fadeIn();

            } else {
                $('.navbar')
                    .removeClass('animated fadeInDown')
                    .addClass('animated fadeOutUp')
                    .fadeOut();
            }
        });
    });

    $('a[href*=#]:not([href=#])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });

    //========================
    //icon hover effect
    //========================
    $('#services img').hover(
        function () {
            $(this).addClass('animated pulse')
        },
        function () {
            $(this).removeClass('animated pulse')
        });

    $('.clientsphoto img').hover(
        function () {
            $(this).addClass('animated pulse')
        },
        function () {
            $(this).removeClass('animated pulse')
        });

    //========================
    //CUSTOM SCROLLBAR
    //========================
    // $('html').niceScroll({
    //     mousescrollstep: 70,
    //     cursorcolor: "#8b9791",
    //     cursorwidth: "5px",
    //     cursorborderradius: "10px",
    //     cursorborder: "none",
    // });
});

