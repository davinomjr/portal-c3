		$(document).ready(function() {

		    window.setTimeout(function() {
		        $(".alert.alert-success").fadeTo(2000, 500).slideUp(500, function() {
		            $(".alert.alert-success").slideUp(500);
		        });
		    }, 3000);

		    // Adds title attributes and classnames to list items	 
		    $("ul li a:contains('Dashboard')").addClass("dashboard").attr('title', 'Dashboard');
		    $("ul li a:contains('Pages')").addClass("pages").attr('title', 'Pages');
		    $("ul li a:contains('Media')").addClass("media").attr('title', 'Media');
		    $("ul li a:contains('History')").addClass("history").attr('title', 'History');
		    $("ul li a:contains('Messages')").addClass("messages").attr('title', 'Messages');
		    $("ul li a:contains('Settings')").addClass("settings").attr('title', 'Settings');

		    $("nav").height($(document).height());
		    loadComponents();

		    // Add class to last list item of submenu	
		    $("ul.submenu li:last-child").addClass("last");


		    // Append Plus icon on thumbnail hover
		    $(".gallery a").hover(function() {
		        $(this).append("<span style='display:none'>&oplus;</span>").find("span").fadeIn(500);
		    }, function() {
		        $(this).find("span").fadeOut(500);
		    });

		    //  Tmeline load
		    i = 200;
		    $(".tl-post").each(function() {
		        $(this).delay(i).animate({ "opacity": 1 });
		        i = i + 200;
		    });

		    $(document).off("click", ".clickable-icon").on("click", ".clickable-icon", function() {
		        var urlLink = $(".clickable-icon").first().siblings("p").children("a").attr("href");
		        window.location = urlLink;
		    })

		    // Table sorter
		    $("tr:not(.table-head):odd").addClass("odd");
		    enableTableSorter();

		    // Equal height divs - www.broken-links.com
		    var highestCol = Math.max($('.widget-container > .widget').height(), $('.widget-container > .widget').height());
		    $('.widget-container > .widget').height(highestCol);

		    // Setttings dropdown menu	
		    $("header span").hover(function() {
		        $(this).find("ul").stop("true", "true").slideDown(500);
		    }, function() {
		        $(this).find("ul").stop("true", "true").slideUp(500);
		    });

		    $(".dropdown ul").wrap("<div />");

		    // Notification/inbox dropdown menu
		    $(".dropdown").hover(function() {
		        $(this).find("div").stop("true", "true").fadeIn(500);
		    }, function() {
		        $(this).find("div").stop("true", "true").fadeOut(500);
		    });

		    // Hide alert
		    $(".close").click(function(e) {
		        e.stopPropagation();
		        $(this).parent().fadeOut(500);
		        // $(".content").delay(300).animate({"marginTop" : 0});
		    });

		    // Navigation accordion menu
		    $(window).bind("load resize", function() {
		        if ($("nav").width() > 100) {
		            $("nav ul li:has(ul)").on('mouseenter', function() {
		                $(this).find("ul.submenu").stop().slideDown(300);
		            }).on('mouseleave', function() {
		                $(this).find("ul.submenu").stop().slideUp(500);
		            });
		        } else {
		            $("nav ul li ul").empty();
		        }
		    });

		    // Mobile navigation

		    $(".ico-font").toggle(function() {
		        $("nav").animate({ "left": 0 }, 20);
		        $("section.content").animate({ marginLeft: 215, marginRight: -215 }, 20);
		        $("section.alert").animate({ marginLeft: 215 }, 20);
		    }, function() {
		        $("nav").animate({ "left": "-215px" });
		        $("section.content").animate({ marginLeft: 0, marginRight: 0 }, 400);
		        $("section.alert").animate({ marginLeft: 0, marginRight: 0 }, 400);
		        return false;
		    });


		    $('.settings-dd li input').each(function() {
		        $(this).next('span').andSelf().wrapAll('<div class="checkbox-wrap"/>');
		    });

		    // // Clear input fields on focus
		    // $('input').each(function() {
		    //     var default_value = this.value;
		    //     $(this).focus(function() {
		    //         if (this.value == default_value) {
		    //             this.value = '';
		    //         }
		    //     });
		    //     $(this).blur(function() {
		    //         if (this.value == '') {
		    //             this.value = default_value;
		    //         }
		    //     });
		    // });
		});

		function loadComponents() {
		    $('.datetime-local').mask('99/99/9999 99:99');
		    $(".daterange").loadDate();

		    $('.multiselect').multiselect({
		        includeSelectAllOption: true,
		        maxHeight: 200
		    });

		    $('.html-editor').summernote({
		        height: 350,
		        lang: 'pt-BR', // default: 'en-US',
		        toolbar: [
		            ['style', ['bold', 'italic', 'underline', 'clear']],
		            ['font', ['strikethrough', 'superscript', 'subscript']],
		            ['fontsize', ['fontsize']],
		            ['fontNames', ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Merriweather']],
		            ['fontsize', ['fontsize']],
		            ['color', ['color']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['misc', ['fullscreen']]
		        ]
		    });
		}

		function enableTableSorter() {
		    var $sorterTable = $(".sorteable-table");
		    var tablesorterConfig = { headers: { 0: { sorter: false } } };
		    tablesorterConfig.headers[$sorterTable.find("thead th").length - 1] = { sorter: false };
		    tablesorterConfig.headers[0] = "";
		    $sorterTable
		        .tablesorter(tablesorterConfig)
		}