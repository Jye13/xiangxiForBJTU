function zan(d,b,a){var c='<span class="zan_ani" id="zan_'+d.data("id")+'" >+1</span>';$.ajax({url:b,type:"POST",dataType:"json",data:{id:d.data("id")},success:function(e){switch(e.code){case -1:document.location.href="/login?url="+document.location.href;break;default:if(a==true){d.text(parseInt(d.text())+1).css("cursor","default")}else{d.css("cursor","default").text("已赞")}$("body").append(c);$("#zan_"+d.data("id")).css({top:d.offset().top-20,left:d.offset().left+d.width()/2-$("#zan_"+d.data("id")).width()/2}).animate({top:"-=50",opacity:0},500,function(){d.data("zan","1");$("#zan_"+d.data("id")).remove()})}}})};