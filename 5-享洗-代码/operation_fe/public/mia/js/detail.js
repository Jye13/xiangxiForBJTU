$(function(){$(".mask").mouseover(function(){$(this).addClass("current")}).mouseout(function(){$(this).removeClass("current")});if($(".moduleFixed").length>0){$(".moduleFixed").moduleFixed({Zindex:5})}var b=$("input[name=gotopSwitch]").val();if(b==1||b==undefined){var b=true}else{var b=false}if(b){$(document).gotop()}$(".moFixed li").click(function(){var e=$(this),d=e.index(),f=$(".datacon").eq(d).offset().top-50;$("html,body").stop().animate({scrollTop:f},1000);c()});$(window).scroll(function(){c()});$(window).resize(function(){c()});function c(){var d=$(document).scrollTop()+50;$(".datacon").each(function(f,e){var g=$(e).offset().top;if(d>=g){a(f)}})}function a(d){var e=$(".moFixed li");e.each(function(f){if(d!=f&&$(this).hasClass("current")){e.removeClass("current")}else{if(!$(this).hasClass("current")&&d==f){$(this).addClass("current")}}})}});$(function(){$tabLi=$(".suitTabTit li");$tabLi.click(function(){var f=$(this).index();e(f);c(f)});function e(f){$tabLi.eq(f).addClass("cur").siblings().removeClass();$(".suitTabCont").eq(f).show().siblings(".suitTabCont").hide()}var b=[];var d=[];for(var a=0;a<$(".suitTabTit li").length;a++){d[a]=0;b[a]=0}function c(o){if(d[o]==1){return}d[o]=1;var f=$(".suitTabCont").eq(o);var q=f.find(".widths");var h=f.find(".prev");var k=f.find(".next");var l=q.find("li");var i=f.find(".goodsBox").width()+83;var g=0;l.last().addClass("last");l.each(function(){g+=$(this).width()});q.css("width",g);var n=l.length;var m=4;var p=Math.ceil(n/m);if(n>m){h.show();k.show()}function j(r){if(!q.is(":animated")){if(r=="left"){b[o]--;if(b[o]<=-1){b[o]=0;return false}q.animate({left:"+="+i})}if(r=="right"){b[o]++;if(b[o]>=p){b[o]=p-1;return false}q.animate({left:"-="+i})}}}h.click(function(){j("left")});k.click(function(){j("right")})}c(0);$(".suitType .st-box").each(function(){var f=$(this).find(".goods li");f.last().addClass("last");if(f.length>=4){$(this).find(".goods").append('<i class="more"></i>')}}).hover(function(){$(this).addClass("hover")},function(){$(this).removeClass("hover")}).click(function(){var f=$(this).index();var g=$(".suitTabOut").offset().top;$(this).addClass("selected").siblings().removeClass("selected");$("body,html").stop().animate({scrollTop:g},500);e(f)})});