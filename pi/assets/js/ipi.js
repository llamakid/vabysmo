$(document).ready(function () {
    $("#nav a h2").hide();
    $('#pi-content').focus();

    $('#nav a h1').click(function (e) {
        $("#nav a h2").hide();
        var section = $(this).parent().attr('href') + '.';
        var $subsections = $('a[href^="' + section + '"] h2');
        $subsections.each(function () {
            $(this).toggle(400);
        });
        $('#pi-content div').scrollTop(0);
        var loc = $('[name="' + $(this).parent().attr('href').substring(1) + '"]').offset().top - $('#pi-content').offset().top - 10;
        $('#pi-content div').animate({scrollTop:loc}, 0);
    })

    $('#nav a h2').click(function (e) {
        $('#pi-content div').scrollTop(0);
        var loc = $('[name="' + $(this).parent().attr('href').substring(1) + '"]').offset().top - $('#pi-content').offset().top - 10;
        $('#pi-content div').animate({scrollTop:loc}, 0);
    })

    $("#searchBox").click(function () {
        $("#next").animate({ opacity:1.0}, 2500);
    })

	// $(".Italics").click(function (e) {
    //     $('#pi-content div').scrollTop(0);
    //     var loc = $('[name="' + $(e.target).attr('href').substring(1) + '"]').offset().top - $('#pi-content').offset().top - 10;
    //     $('#pi-content div').animate({scrollTop:loc}, 0);
    // })

});

function backToTop(el) {
    $("#nav h2").hide();
    $('#nav').scrollTop(0);
    $('#pi-content div').animate({scrollTop:0}, 500);
    $('#nav #scrollable').animate({scrollTop:0}, 500);
}
