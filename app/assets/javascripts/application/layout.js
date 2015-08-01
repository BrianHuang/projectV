var items = {};
var banner = {};
var banner_index;
var timestamp_offset = 0;
function iToS(source){
  var ans = Math.abs(source).toString(); return (ans.length <= 1 ? '0' + ans : ans);
}
function formatTimer(timeinsec){
  if(timeinsec > 0){
    var days = parseInt(timeinsec/86400);
    if(days > 2){
      return days + '天' + parseInt((timeinsec%86400)/3600) + '時' + iToS(parseInt((timeinsec%3600)/60)) + '分';
    }else{
      return iToS(parseInt(timeinsec/3600)) + '時' + iToS(parseInt((timeinsec%3600)/60)) + '分' + iToS(parseInt(timeinsec%60)) + '秒';
    }
  }else{
    return '00時00分00秒';
  }
}
function tick(){
  for(var i in items){
    var item = items[i];
    var left = item.timestamp - (new Date).getTime() + timestamp_offset; // server_timestamp
    item.timer.html(formatTimer(left / 1000));
  }
  setTimeout(tick , 1000);
}
jQuery(function($){
  timestamp_offset = (new Date()).getTime() - parseInt($('meta[name="timestamp"]').attr('content'));
  $('.banner_item_show .item , .item_details .item , .col2_item_list .item').each(function(){
    items[$(this).attr('data-type') + '_' + $(this).attr('data-id')] = {
      timer:$(this).find('.timer'),
      timestamp:parseInt($(this).attr('data-timestamp'))
    };
  });
  setTimeout(tick , 1000);
  
  var target = $('#banner');
  if(target[0]){
    target.find('.menubar .item').mouseover(function(){
      var id = $(this).attr('data-id');
      if(banner_index !== id){
        console.log(id);
        banner_index = id;
        $(this).addClass('active').siblings('.active').removeClass('active').end();
        if(!banner[id]){
          banner[id] = $('#banner .banner_item_show .item[data-id=' + id + ']');
        }
        banner[id].addClass('active').siblings('.active').removeClass('active');
      }
    });
  }
  $('#float_control .top').click(function(){
    $(window).scrollTop(0);
  });
});