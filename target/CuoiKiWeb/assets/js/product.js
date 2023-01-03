
$(document).ready(function() {
    $('#filter').click(function(e){
        $('.filter-mobile').toggleClass('xyz');
        $('.overlay2').toggleClass('hidden');
    })
    $('.overlay2').click(function(e){
        $('.filter-mobile').toggleClass('xyz');
        $('.overlay2').toggleClass('hidden');
    })
    $('.foo').click(function() {
        $(this).toggleClass('active');
    })
    $('.sortby .dropdown-item').click(function() {
        $('.sortby .dropdown-toggle').text($(this).text());
        $('.sortby .dropdown-item').removeClass('isactive');
        $(this).addClass('isactive');
    });
})
