var config = window.config = {};

// Config reference element
var $ref = $("#ref");

// Configure responsive bootstrap toolkit
config.ResponsiveBootstrapToolkitVisibilityDivs = {
    'xs': $('<div class="device-xs hidden-sm-up"></div>'),
    'sm': $('<div class="device-sm hidden-xs-down hidden-md-up"></div>'),
    'md': $('<div class="device-md hidden-sm-down hidden-lg-up"></div>'),
    'lg': $('<div class="device-lg hidden-md-down hidden-xl-up"></div>'),
    'xl': $('<div class="device-xl hidden-lg-down"></div>'),
};

ResponsiveBootstrapToolkit.use('Custom', config.ResponsiveBootstrapToolkitVisibilityDivs);
//validation configuration
config.validations = {
    debug: true,
    errorClass:'has-error',
    validClass:'success',
    errorElement:"span",

    // add error class
    highlight: function(element, errorClass, validClass) {
        $(element).parents("div.form-group")
            .addClass(errorClass)
            .removeClass(validClass);
    },

    // add error class
    unhighlight: function(element, errorClass, validClass) {
        $(element).parents(".has-error")
            .removeClass(errorClass)
            .addClass(validClass);
    },

    // submit handler
    submitHandler: function(form) {
        form.submit();
    }
}

//delay time configuration
config.delayTime = 50;

// chart configurations
config.chart = {};

config.chart.colorPrimary = tinycolor($ref.find(".chart .color-primary").css("color"));
config.chart.colorSecondary = tinycolor($ref.find(".chart .color-secondary").css("color"));
/***********************************************
 *        Animation Settings
 ***********************************************/
function animate(options) {
    var animationName = "animated " + options.name;
    var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
    $(options.selector)
        .addClass(animationName)
        .one(animationEnd,
            function(){
                $(this).removeClass(animationName);
            }
        );
}

$(function() {
    var $itemActions = $(".item-actions-dropdown");

    $(document).on('click',function(e) {
        if (!$(e.target).closest('.item-actions-dropdown').length) {
            $itemActions.removeClass('active');
        }
    });

    $('.item-actions-toggle-btn').on('click',function(e){
        e.preventDefault();
        var $thisActionList = $(this).closest('.item-actions-dropdown');
        $itemActions.not($thisActionList).removeClass('active');
        $thisActionList.toggleClass('active');
    });
});

/***********************************************
 *        NProgress Settings
 ***********************************************/
var npSettings = {
    easing: 'ease',
    speed: 500
}

NProgress.configure(npSettings);
$(function() {
    setSameHeights();

    var resizeTimer;

    $(window).resize(function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(setSameHeights, 150);
    });
});


function setSameHeights($container) {

    $container = $container || $('.sameheight-container');

    var viewport = ResponsiveBootstrapToolkit.current();

    $container.each(function() {

        var $items = $(this).find(".sameheight-item");

        // Get max height of items in container
        var maxHeight = 0;

        $items.each(function() {
            $(this).css({height: 'auto'});
            maxHeight = Math.max(maxHeight, $(this).innerHeight());
        });


        // Set heights of items
        $items.each(function() {
            // Ignored viewports for item
            var excludedStr = $(this).data('exclude') || '';
            var excluded = excludedStr.split(',');

            // Set height of element if it's not excluded on
            if (excluded.indexOf(viewport) === -1) {
                $(this).innerHeight(maxHeight);
            }
        });
    });
}

$(function() {
    animate({
        name: 'flipInY',
        selector: '.error-card > .error-title-block'
    });


    setTimeout(function(){
        var $el = $('.error-card > .error-container');

        animate({
            name: 'fadeInUp',
            selector: $el
        });

        $el.addClass('visible');
    }, 1000);
})
//LoginForm validation
$(function() {
    if (!$('#login-form').length) {
        return false;
    }

    var loginValidationSettings = {
        rules: {
            username: {
                required: true
            },
            password: "required"
        },
        messages: {
            username: {
                required: "Yêu cầu nhập email/username"
            },
            password:  "Yêu càu nhập password"
        },
        invalidHandler: function() {
            animate({
                name: 'shake',
                selector: '.auth-container > .card'
            });
        }
    }

    $.extend(loginValidationSettings, config.validations);

    $('#login-form').validate(loginValidationSettings);
})
//ResetForm validation
$(function() {
    if (!$('#reset-form').length) {
        return false;
    }

    var resetValidationSettings = {
        rules: {
            email1: {
                required: true
            }
        },
        messages: {
            email1: {
                required: "Vui lòng điền email hoặc tên đăng nhập"
            }
        },
        invalidHandler: function() {
            animate({
                name: 'shake',
                selector: '.auth-container > .card'
            });
        }
    }

    $.extend(resetValidationSettings, config.validations);

    $('#reset-form').validate(resetValidationSettings);
})
$(function() {
    $(".wyswyg").each(function() {
        var $editor = $(this).find(".editor");
        var $toolbar = $(this).find(".toolbar");
        var editor = new Quill($editor.get(0), {
            theme: 'snow',
            modules: {
                toolbar: $toolbar.get(0)
            }
        });

    });

});

$(function () {
    $('#sidebar-menu, #customize-menu').metisMenu({
        activeClass: 'open'
    });

    $('#sidebar-collapse-btn').on('click', function(event){
        event.preventDefault();

        $("#app").toggleClass("sidebar-open");
    });

    $("#sidebar-overlay").on('click', function() {
        $("#app").removeClass("sidebar-open");
    });

    if ($.browser.mobile) {
        var $appContainer = $('#app ');
        var $mobileHandle = $('#sidebar-mobile-menu-handle ');

        $mobileHandle.swipe({
            swipeLeft: function() {
                if($appContainer.hasClass("sidebar-open")) {
                    $appContainer.removeClass("sidebar-open");
                }
            },
            swipeRight: function() {
                if(!$appContainer.hasClass("sidebar-open")) {
                    $appContainer.addClass("sidebar-open");
                }
            },
            // excludedElements: "button, input, select, textarea, .noSwipe, table",
            triggerOnTouchEnd: false
        });
    }

});
$(function() {


    function drawDashboardItemsListSparklines(){
        $(".dashboard-page .items .sparkline").each(function() {
            var type = $(this).data('type');

            // There is predefined data
            if ($(this).data('data')) {
                var data = $(this).data('data').split(',').map(function(item) {
                    if (item.indexOf(":") > 0) {
                        return item.split(":");
                    }
                    else {
                        return item;
                    }
                });
            }
            // Generate random data
            else {
                var data = [];
                for (var i = 0; i < 17; i++) {
                    data.push(Math.round(100 * Math.random()));
                }
            }


            $(this).sparkline(data, {
                barColor: config.chart.colorPrimary.toString(),
                height: $(this).height(),
                type: type
            });
        });
    }

    drawDashboardItemsListSparklines();

    $(document).on("themechange", function(){
        drawDashboardItemsListSparklines();
    });
});
$(function() {

    var $dashboardSalesMap = $('#dashboard-sales-map');

    if (!$dashboardSalesMap.length) {
        return false;
    }

    function drawSalesMap() {

        $dashboardSalesMap.empty();

        var color = config.chart.colorPrimary.toHexString();
        var darkColor = tinycolor(config.chart.colorPrimary.toString()).darken(40).toHexString();
        var selectedColor = tinycolor(config.chart.colorPrimary.toString()).darken(10).toHexString();

        var sales_data = {
            us: 2000,
            ru: 2000,
            gb: 10000,
            fr: 10000,
            de: 10000,
            cn: 10000,
            in: 10000,
            sa: 10000,
            ca: 10000,
            br: 5000,
            au: 5000
        };

        $dashboardSalesMap.vectorMap({
            map: 'world_en',
            backgroundColor: 'transparent',
            color: '#E5E3E5',
            hoverOpacity: 0.7,
            selectedColor: selectedColor,
            enableZoom: true,
            showTooltip: true,
            values: sales_data,
            scaleColors: [ color, darkColor],
            normalizeFunction: 'linear'
        });
    }

    drawSalesMap();

    $(document).on("themechange", function(){
        drawSalesMap();
    });
});
$(function() {

    var $dashboardSalesBreakdownChart = $('#dashboard-sales-breakdown-chart');

    if (!$dashboardSalesBreakdownChart.length) {
        return false;
    }

    function drawSalesChart(){

        $dashboardSalesBreakdownChart.empty();

        Morris.Donut({
            element: 'dashboard-sales-breakdown-chart',
            data: [{ label: "Ví điện tử", value: 12 },
                { label: "Chuyển khoản", value: 30 },
                { label: "Tiền mặt", value: 20 } ],
            resize: true,
            colors: [
                tinycolor(config.chart.colorPrimary.toString()).lighten(10).toString(),
                tinycolor(config.chart.colorPrimary.toString()).darken(8).toString(),
                config.chart.colorPrimary.toString()
            ],
        });

        var $sameheightContainer = $dashboardSalesBreakdownChart.closest(".sameheight-container");

        setSameHeights($sameheightContainer);
    }

    drawSalesChart();

    $(document).on("themechange", function(){
        drawSalesChart();
    });

})
$(function() {

    $('.actions-list > li').on('click', '.check', function(e){
        e.preventDefault();

        $(this).parents('.tasks-item')
            .find('.checkbox')
            .prop("checked",  true);

        removeActionList();
    });

});
$(function(){

    // set sortable options
    var sortable = new Sortable($('.images-container').get(0), {
        animation: 150,
        handle: ".control-btn.move",
        draggable: ".image-container",
        onMove: function (evt) {
            var $relatedElem = $(evt.related);

            if ($relatedElem.hasClass('add-image')) {
                return false;
            }
        }
    });


    $controlsButtons = $('.controls');

    $controlsButtonsStar = $controlsButtons.find('.star');
    $controlsButtonsRemove = $controlsButtons.find('.remove');

    $controlsButtonsStar.on('click',function(e){
        e.preventDefault();

        $controlsButtonsStar.removeClass('active');
        $controlsButtonsStar.parents('.image-container').removeClass('main');

        $(this).addClass('active');

        $(this).parents('.image-container').addClass('main');
    })

})

$(function() {

    if (!$('#select-all-items').length) {
        return false;
    }


    $('#select-all-items').on('change', function() {
        var $this = $(this).children(':checkbox').get(0);

        $(this).parents('li')
            .siblings()
            .find(':checkbox')
            .prop('checked', $this.checked)
            .val($this.checked)
            .change();
    });


    function drawItemsListSparklines(){
        $(".items-list-page .sparkline").each(function() {
            var type = $(this).data('type');

            // Generate random data
            var data = [];
            for (var i = 0; i < 17; i++) {
                data.push(Math.round(100 * Math.random()));
            }

            $(this).sparkline(data, {
                barColor: config.chart.colorPrimary.toString(),
                height: $(this).height(),
                type: type
            });
        });
    }

    drawItemsListSparklines();

    $(document).on("themechange", function(){
        drawItemsListSparklines();
    });

});
//LoginForm validation
$(function() {
    if (!$('.form-control').length) {
        return false;
    }

    $('.form-control').focus(function() {
        $(this).siblings('.input-group-addon').addClass('focus');
    });

    $('.form-control').blur(function() {
        $(this).siblings('.input-group-addon').removeClass('focus');
    });
});
var modalMedia = {
    $el: $("#modal-media"),
    result: {},
    options: {},
    open: function(options) {
        options = options || {};
        this.options = options;


        this.$el.modal('show');
    },
    close: function() {
        if ($.isFunction(this.options.beforeClose)) {
            this.options.beforeClose(this.result);
        }

        this.$el.modal('hide');

        if ($.isFunction(this.options.afterClose)) {
            this.options.beforeClose(this.result);
        }
    }
};

$(function () {

    // Local storage settings
    var themeSettings = getThemeSettings();

    var $app = $('#app');
    var $styleLink = $('#theme-style');
    var $customizeMenu = $('#customize-menu');

    var $customizeMenuColorBtns = $customizeMenu.find('.color-item');

    var $customizeMenuRadioBtns = $customizeMenu.find('.radio');

    setThemeSettings();
    $customizeMenuColorBtns.on('click', function() {
        themeSettings.themeName = $(this).data('theme');

        setThemeSettings();
    });


    $customizeMenuRadioBtns.on('click', function() {

        var optionName = $(this).prop('name');
        var value = $(this).val();

        themeSettings[optionName] = value;

        setThemeSettings();
    });

    function setThemeSettings() {
        setThemeState()
            .delay(config.delayTime)
            .queue(function (next) {

                setThemeColor();
                setThemeControlsState();
                saveThemeSettings();

                $(document).trigger("themechange");

                next();
            });
    }

    /************************************************
     *			Update theme based on options
     *************************************************/

    function setThemeState() {
        // set theme type
        if (themeSettings.themeName) {
            $styleLink.attr('href', 'css/app-' + themeSettings.themeName + '.css');
        }
        else {
            $styleLink.attr('href', 'css/app.css');
        }

        // App classes
        $app.removeClass('header-fixed footer-fixed sidebar-fixed');

        // set header
        $app.addClass(themeSettings.headerPosition);

        // set footer
        $app.addClass(themeSettings.footerPosition);

        // set footer
        $app.addClass(themeSettings.sidebarPosition);

        return $app;
    }

    /************************************************
     *			Update theme controls based on options
     *************************************************/

    function setThemeControlsState() {
        // set color switcher
        $customizeMenuColorBtns.each(function() {
            if($(this).data('theme') === themeSettings.themeName) {
                $(this).addClass('active');
            }
            else {
                $(this).removeClass('active');
            }
        });

        // set radio buttons
        $customizeMenuRadioBtns.each(function() {
            var name = $(this).prop('name');
            var value = $(this).val();

            if (themeSettings[name] === value) {
                $(this).prop("checked", true );
            }
            else {
                $(this).prop("checked", false );
            }
        });
    }

    /************************************************
     *			Update theme color
     *************************************************/
    function setThemeColor(){
        config.chart.colorPrimary = tinycolor($ref.find(".chart .color-primary").css("color"));
        config.chart.colorSecondary = tinycolor($ref.find(".chart .color-secondary").css("color"));
    }

    /************************************************
     *				Storage Functions
     *************************************************/

    function getThemeSettings() {
        var settings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) : {};

        settings.headerPosition = settings.headerPosition || '';
        settings.sidebarPosition = settings.sidebarPosition || '';
        settings.footerPosition = settings.footerPosition || '';

        return settings;
    }

    function saveThemeSettings() {
        localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
    }

});
$(function() {

    $("body").addClass("loaded");

});

/***********************************************
 *        NProgress Settings
 ***********************************************/

// start load bar
NProgress.start();

// end loading bar 
NProgress.done();