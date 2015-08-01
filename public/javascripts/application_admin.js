//for global dialog
function site_dialog_callback_open(){} //wait overwrite
function site_dialog_callback_close(){}
function site_dialog_callback(url , content , title , width , height ,open ,close){
  $('body').append("<div class='site_dialog'>" + content + "</div>");
  if(url != null){
    $('div.site_dialog').load(url , function() {
      $(this).dialog({title: title,modal: true,width: width || document.body.clientWidth - 30 ,height: height || document.body.clientHeight - 30,open:open ? function(){site_dialog_callback_open();open();} : function(){},close: close ? function(){site_dialog_callback_close();close();$("div.site_dialog").remove();} : function(){$("div.site_dialog").remove();}});
    });
  }else{
     $('div.site_dialog').dialog({title: title,modal: true,width: width || document.body.clientWidth - 30 ,height: height || document.body.clientHeight - 30,open:open ? function(){open();} : function(){},close: close ? function(){close();$("div.site_dialog").remove();} : function(){$("div.site_dialog").remove();}});
  }
}
function site_dialog(content , title , width , height){
  site_dialog_callback(null,content , title , width , height ,function(){},function(){});
}
function site_dialog_load(url , title , width , height){
  site_dialog_callback(url , null , title , width , height ,function(){},function(){})
}
function site_dialog_iframe(url , title , width , height){
  site_dialog_iframe(url , title , width , height , "dialog_iframe")
}
function site_dialog_iframe(url , title , width , height , name){
  site_dialog("<iframe width=100% height=100% frameborder=\"0\" border=\"0\" cellspacing=\"0\" src=\"" + url + "\" name=\"" + name + "\" id=\"" + name + "\"></iframe>" , title , width , height)
}
function site_dialog_close(){
  $('div.site_dialog').dialog("close");
}
//for theme
function style_preview(content){
  var temp = $("head style#style_preview");
  if(temp[0]){
    temp.html(content);
  }else{
    $("head").append("<style id='style_preview'>" + content + "</style>")
  }
  temp = null;
}
//for ajax menu call
function menuCallback(scope, e){
  //console.log($(e.src).parent().parent().parent())
}
function buildMenu(target){
  target.menu({onClick : function(scope, e){menuCallback(scope, e)}});
}
//for theme
function showAlert(is_show){}
function resetIflink(){
  $(".site_dialog .iflink").click(function(){
    $.get($(this).attr("href"), null, function(txt){
      $(".site_dialog").html(txt);
      resetIflink();
    })
    return false;
  })
}
function site_dialog_callback_close(){
  showAlert(false);
}
function textAlert(is_show , text){
  $("#alert .alert_message").html(text);
  showAlert(is_show);
}
function showAlert(is_show){
  is_show ? $("#alert").removeClass("hide") : $("#alert").addClass("hide");
}
function rconfigure(target , is_use){}
function before_submit(){return true;}

jQuery(function($){
  var super_temp = null;
  super_temp = $('.configure_button')
  if(super_temp[0]){
    buildMenu(super_temp);
  }
  super_temp = $('.tip')
  if(super_temp[0]){
    super_temp.tooltip();
  }
  $('table.hrform td').mouseover(function(){
    $(this).addClass("hover");
  }).mouseout(function(){
    $(this).removeClass("hover");
  });
  super_temp = $(".configure_list.row1 tr:even , .configure_list.row2 tr:nth-child(4n+1) , .configure_list.row2 tr:nth-child(4n+2)")
  if(super_temp[0]){
    super_temp.addClass("odd");
  }
  //擴充用innerview
  super_temp = $("a.site_iframe")
  if(super_temp[0]){
    super_temp.click(function(){
      site_dialog_iframe($(this).attr('href') , $(this).attr('title') , $(this).attr('data-width') , $(this).attr('data-height') , $(this).attr('data-title'))
      return false;
    })
  }
  super_temp = $(".iflink")
  if(super_temp[0]){
    super_temp.click(function(){
      showAlert(true);
      if($(".site_dialog")[0]){
        if($(this).attr("data-title")){
          $(".ui-dialog-title").html($(this).attr("data-title"))
        }else{
          $(".ui-dialog-title").html($(this).html())
        }
        $.get($(this).attr("href"), null, function(txt){
          $(".site_dialog").html(txt);
          resetIflink();
          showAlert(false);
        })
      }else{
        site_dialog_callback($(this).attr("href") ,null, $(this).attr("data-title") || $(this).html() , $(this).attr("data-width") , $(this).attr("data-height") , function(){
          resetIflink();
          showAlert(false);
        } , function(){});
      }
      return false;
    })
  }
  super_temp = null;
  
  //需先於a.send_form，或是任何confirm的action

  $("[data-confirm-sp]").click(function(event){
    if(!confirm($(this).attr("data-confirm") || "確定要進行此動作？")){
      // Stop any other click events on $(this) from happening this instance.
      event.stopImmediatePropagation();
      return false;
    }
    return true;
  });

  $("a.send_form").click(function(){
    $("#content_space form").attr("action" , $(this).attr("href")).submit();
    return false;
  })
  $("#sidebar .main_menu .sub_menu .tree_node").click(function(){
    if($(this).parent().hasClass("tree_node_drop")){
      $(this).parent().removeClass("tree_node_drop").find("ul").removeClass("hide");
      
    }else{
      $(this).parent().addClass("tree_node_drop").find("ul").addClass("hide");
    }
  })
  $(".form_submiter #submit_me").click(function(){
    if(before_submit()){
      $("#content_space form").submit();
    }
  })
  $(".form_submiter #reset_me").click(function(){
    $("#content_space form")[0].reset();
  })
  $(".admin .hrform th.ht").click(function(){
    if($(this).hasClass("ht_hide")){
      $(this).removeClass("ht_hide").parents(".hrform").find("tr." + $(this).attr("id")).removeClass("hide");
    }else{
      $(this).addClass("ht_hide").parents(".hrform").find("tr." + $(this).attr("id")).addClass("hide");
    }
  })
  $(".check_me input.check_all").click(function(){
    $(this).parents("#content_space").find(".check_me input[type='checkbox']").attr("checked" , !!$(this).attr("checked")); //!! : parse to boolean
  })
  
  $(".rconfigure").click(function(){
    if($(this).hasClass("rconfigure_hover")){
      $(".rconfigure_hover").removeClass("rconfigure_hover");
      rconfigure($(this) , false);
    }else{
      $(".rconfigure_hover").removeClass("rconfigure_hover");
      $(this).addClass("rconfigure_hover");
      rconfigure($(this) , true);
    }
  })
  $(".redirect_switch_org").click(function(){
    site_dialog_callback($(this).attr("href") ,null, $(this).attr("title") , null , null , function(){} , function(){});
    return false;
  })
  showAlert(false);
})