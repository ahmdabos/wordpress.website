
jQuery(document).ready(function($) {

    var lang = '', next = '', prev = '', isRTL = false;
    if ($('html').attr('lang') === 'ar') {

        next = 'التالي';
        prev = 'السابق';

        isRTL = true;
    } else {

        next = 'Next';
        prev = 'Previous';

        isRTL = false;
    }

    setTimeout(function(){
        $('body').addClass('loaded');
    }, 500);

    loader();

    function loader(_success) {
        var obj = document.querySelector('.loader'),
            inner = document.querySelector('.preloader_inner'),
            page = document.querySelector('body');
        obj.classList.add('show');
        page.classList.remove('show');
        var w = 0,
            t = setInterval(function() {
                w = w + 1;
                inner.textContent = w+'%';
                if (w === 100){
                    obj.classList.remove('show');
                    page.classList.add('show');
                    clearInterval(t);
                    w = 0;
                    if (_success){
                        return _success();
                    }
                }
            }, 30);
    }


    $('.burger-icons').click(function(){
        $(this).toggleClass('open');
        $('.manu-item').toggleClass('open');
    });
    $('.buger-close ').click(function(){
        $('.manu-item').removeClass('open');

    });





    $(window).bind('scroll', function () {
        var windowSize = $(window).width();
        if (windowSize > 0) {
            if ($(this).scrollTop() > 100) {
                $('header, .dropdown-content').addClass('fixed');
            } else {
                $('header, .dropdown-content').removeClass('fixed');
            }
        }
        return false;
    });


    $(document).on('click', 'a[href^="#"]', function(e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $($.attr(this, 'href')).offset().top
        }, 500);
    });

    $('.main-banner').owlCarousel({
        loop:false,
        margin:0,
        nav: false,
        dots: true,
        items:1,
        //rtl: isRTL,

    })


    $('.event-list').owlCarousel({
        loop:false,
        margin:30,
        nav: false,
        dots: true,
        //rtl: isRTL,
        responsive:{
            0:{
                items:1
            },
            767:{
                items:2
            },
            991:{
                items:3
            }
        }
    })










})


