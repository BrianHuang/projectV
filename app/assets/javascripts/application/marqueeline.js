function marqueeline(slideBox){
  if(slideBox[0]){
    var delay = slideBox.attr("data-delay") ? parseInt(slideBox.attr("data-delay")) : 3500;
    var speed = slideBox.attr("data-speed") ? parseInt(slideBox.attr("data-speed")) : 20;
    var timer , pause , line_height = parseInt(slideBox.find(":first").outerHeight());
    var go = function(){
      timer = setInterval(slide,speed);
    };
    var slide = function(){
      if(pause){
        return;
      }else if(slideBox.scrollTop(slideBox.scrollTop() + 1).scrollTop() % line_height == 0){
        clearInterval(timer);
        slideBox.append(slideBox.find(":first")).scrollTop(0);
        setTimeout(go,delay);
      }
    };
    slideBox.mouseover(function(){pause = true;}).mouseout(function(){pause = false;});
    setTimeout(go,delay);
  }
}
jQuery(function($){
  marqueeline($('.marqueeline'));
});