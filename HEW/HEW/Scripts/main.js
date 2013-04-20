if(!Date.prototype.toISOString) 
{
    Date.prototype.toISOString = function() 
	{
        function pad(n) {return n < 10 ? '0' + n : n}
        return this.getUTCFullYear() + '-'
            + pad(this.getUTCMonth() + 1) + '-'
                + pad(this.getUTCDate()) + 'T'
                    + pad(this.getUTCHours()) + ':'
                        + pad(this.getUTCMinutes()) + ':'
                            + pad(this.getUTCSeconds()) + 'Z';
    };
}
function onAfterSlide(prevSlide, currentSlide)
{
	var expando = $(this).get(0)[jQuery.expando];
	$("#slider_navigation_" + expando + " .slider_control").addClass("inactive");
	$("#" + $(currentSlide).attr("id") + "_content").fadeIn(200, function(){
		$("#slider_navigation_" + expando + " .slider_control").removeClass("inactive");
	});	
}
function onBeforeSlide(prevSlide, currentSlide)
{
	var expando = $(this).get(0)[jQuery.expando];
	$(".slider_" + expando + "_content_container .slider_content").fadeOut(200);
	var position = $($("#" + $(currentSlide).attr("id") + "_control")).position();
	var positionPrev = $($("#" + $(prevSlide).attr("id") + "_control")).position();
	$("#slider_navigation_" + expando + " .slider_control_bar").css("display", "none");
	$("#slider_navigation_" + expando + " .slider_bar").css({
		"display": "block",
		"margin-left": positionPrev.left + "px"
	});
	$("#slider_navigation_" + expando + " .slider_bar").animate({
		'margin-left': position.left + "px"
	}, 750, "easeInOutQuint", function(){
		$(this).css("display", "none");
		$("#" + $(currentSlide).attr("id") + "_control").children("#slider_navigation_" + expando + " .slider_control_bar").css("display", "block");
	});
}
var map = null;
jQuery(document).ready(function($){
	//mobile menu
	$(".mobile_menu select").change(function(){
		window.location.href = $(this).val();
		return;
	});
	
	//slider
	$(".slider").carouFredSel({
		responsive: true,
		prev: {
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 750
		},
		next: {
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 750
		},
		auto: {
			play: true,
			pauseDuration: 5000,
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 750
		}
	},
	{
		wrapper: {
			classname: "caroufredsel_wrapper caroufredsel_wrapper_slider"
		}
	});
	$(".slider").sliderControl({
		appendTo: $(".slider_content_box"),
		contentContainer: $(".slider_content_box")
	});
	
	//image carousel
	$(".image_carousel").carouFredSel({
		responsive: true,
		prev: {
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 150
		},
		next: {
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 150
		},
		auto: {
			play: false,
			pauseDuration: 5000,
			onAfter: onAfterSlide,
			onBefore: onBeforeSlide,
			easing: "easeInOutQuint",
			duration: 150
		}
	});
	$(".image_carousel").sliderControl({
		appendTo: "",
		contentContainer: ""
	});
	
	/*$("ul.gallery_item_details_list").css({
		"height": 0,
		"display": "none"
	});
	$(".gallery_item_details_list li.gallery_item_details").css("display", "none");*/
	
	//horizontal carousel
	$(".horizontal_carousel").carouFredSel({
		items: {
			visible: 4
		},
		scroll: {
			items: 1,
			easing: "swing",
			pauseOnHover: true
		},
		auto: {
			play: false,
			items: 1
		}
	});
	$(".our_clinic").trigger("configuration", {
		prev: '#our_clinic_prev',
		next: '#our_clinic_next'
	});
	$(".carousel").trigger("configuration", {
		prev: '#carousel_prev',
		next: '#carousel_next'
	});
	setTimeout(function(){
		$(".testimonials").trigger("configuration", {
			items: {
				visible: 2
			},
			prev: '#testimonials_prev',
			next: '#testimonials_next'
		});
	}, 1000);
	
	//training_classes
	$(".accordion").accordion({
		event: 'change',
		autoHeight: false/*,
		active: false,
		collapsible: true*/
	});
	$(".accordion.wide").bind("accordionchange", function(event, ui){
		$("html, body").animate({scrollTop: $("#"+$(ui.newHeader).attr("id")).offset().top}, 400);
	});
	$(".tabs").bind("tabsbeforeactivate", function(event, ui){
		$("html, body").animate({scrollTop: $("#"+$(ui.newTab).children("a").attr("id")).offset().top}, 400);
	});
	$(".tabs").tabs({
		event: 'change',
		show: true,
		create: function(){
			$("html, body").scrollTop(0);
		}
	});
	
	//image controls
	var currentControls;
	$(".gallery_box").hover(function(){
		var width = $(this).find("img").first().width();
		var height = $(this).find("img").first().height();
		currentControls = $(this).find(".controls");
		var currentControlsWidth = currentControls.outerWidth();
		var currentControlsHeight = currentControls.outerHeight();
		currentControls.stop();
		currentControls.css({
			"display": "block",
			"margin-left": (width/2-currentControlsWidth/2) + "px",
			"top": (height) + "px"
		});
		currentControls.animate({"top": (height/2-currentControlsHeight/2) + "px"},250,'easeInOutCubic');		
	},function(){
		currentControls.stop();
		currentControls.css("display", "block");
		var height = $(this).find("img").first().height();
		currentControls.animate({"top": (height) + "px"},250,'easeInOutCubic', function(){
			$(this).css("display","none");
		});
	});
	
	//browser history
	$(".tabs .ui-tabs-nav a").click(function(){
		if($(this).attr("href").substr(0,4)!="http")
			$.bbq.pushState($(this).attr("href"));
		else
			window.location.href = $(this).attr("href");
	});
	$(".ui-accordion .ui-accordion-header").click(function(){
		$.bbq.pushState("#" + $(this).attr("id").replace("accordion-", ""));
	});
	
	//tabs box navigation
	$(".tabs_box_navigation").mouseover(function(){
		$(this).find("ul").removeClass("tabs_box_navigation_hidden");
	});
	$(".tabs_box_navigation a").click(function(){
		$(".tabs_box_navigation_selected .selected").removeClass("selected");
		$(this).parent().addClass("selected");
		$(this).parent().parent().parent().children('span').text($(this).text());
		$(this).parent().parent().addClass("tabs_box_navigation_hidden");
	});
	$(".contact_form .tabs_box_navigation a").click(function(event){
		event.preventDefault();
		$(this).parent().parent().parent().children("[type='hidden']").first().val($.trim($(this).text()));
	});
	
});

	(function(a){a.tiny=a.tiny||{};a.tiny.carousel={options:{start:1,display:1,axis:"x",controls:true,pager:false,interval:false,intervaltime:3000,rewind:false,animation:true,duration:1000,callback:null}};a.fn.tinycarousel_start=function(){a(this).data("tcl").start()};a.fn.tinycarousel_stop=function(){a(this).data("tcl").stop()};a.fn.tinycarousel_move=function(c){a(this).data("tcl").move(c-1,true)};function b(q,e){var i=this,h=a(".viewport:first",q),g=a(".overview:first",q),k=g.children(),f=a(".next:first",q),d=a(".prev:first",q),l=a(".pager:first",q),w=0,u=0,p=0,j=undefined,o=false,n=true,s=e.axis==="x";function m(){if(e.controls){d.toggleClass("disable",p<=0);f.toggleClass("disable",!(p+1<u))}if(e.pager){var x=a(".pagenum",l);x.removeClass("active");a(x[p]).addClass("active")}}function v(x){if(a(this).hasClass("pagenum")){i.move(parseInt(this.rel,10),true)}return false}function t(){if(e.interval&&!o){clearTimeout(j);j=setTimeout(function(){p=p+1===u?-1:p;n=p+1===u?false:p===0?true:n;i.move(n?1:-1)},e.intervaltime)}}function r(){if(e.controls&&d.length>0&&f.length>0){d.click(function(){i.move(-1);return false});f.click(function(){i.move(1);return false})}if(e.interval){q.hover(i.stop,i.start)}if(e.pager&&l.length>0){a("a",l).click(v)}}this.stop=function(){clearTimeout(j);o=true};this.start=function(){o=false;t()};this.move=function(y,z){p=z?y:p+=y;if(p>-1&&p<u){var x={};x[s?"left":"top"]=-(p*(w*e.display));g.animate(x,{queue:false,duration:e.animation?e.duration:0,complete:function(){if(typeof e.callback==="function"){e.callback.call(this,k[p],p)}}});m();t()}};function c(){w=s?a(k[0]).outerWidth(true):a(k[0]).outerHeight(true);var x=Math.ceil(((s?h.outerWidth():h.outerHeight())/(w*e.display))-1);u=Math.max(1,Math.ceil(k.length/e.display)-x);p=Math.min(u,Math.max(1,e.start))-2;g.css(s?"width":"height",(w*k.length));i.move(1);r();return i}return c()}a.fn.tinycarousel=function(d){var c=a.extend({},a.tiny.carousel.options,d);this.each(function(){a(this).data("tcl",new b(a(this),c))});return this}}(jQuery));



