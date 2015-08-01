/*
 * jQuery Tooltip plugin 1.3
 *
 * http://bassistance.de/jquery-plugins/jquery-plugin-tooltip/
 * http://docs.jquery.com/Plugins/Tooltip
 *
 * Copyright (c) 2006 - 2008 Jörn Zaefferer
 *
 * $Id: jquery.tooltip.js 5741 2008-06-21 15:22:16Z joern.zaefferer $
 * 
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *   
 *   
 * JokerCatz fix for QuickBid.com.tw
 */
(function($){var helper = {},current;
  $.tooltip = {
    defaults:{
      track:true,
      top:5,
      left:15,
      id:"tooltip"
    }
  };
  $.fn.extend({
    tooltip:function(){
      createHelper();
      return this.each(function(){
          this.tooltipText = this.title;
          this.alt = "";
          $(this).removeAttr("title");
        }).mouseover(save).mouseout(hide).click(hide);
    }
  });
  function createHelper(){
    if(helper.parent)return;
    helper.parent = $('<div id="' + $.tooltip.defaults.id + '" style="right:auto;display:none;"><div class="body"></div></div>').appendTo(document.body);
    helper.body = $('div.body' , helper.parent);
  }
  function handle(event){
    show(false);
    $(document.body).bind('mousemove', update);
    update(event);
  }
  function save(){
    if(this == current || !this.tooltipText)return;
    helper.body.empty().append(this.tooltipText);
    handle.apply(current = this,arguments);
  }
  function show(needUpdate){
    helper.parent.show();
    if(needUpdate)update();
  }
  function update(event){
    if(!current || !$.tooltip.defaults.track){
      $(document.body).unbind('mousemove', update);
      if(!current)return;
    }
    if(event)helper.parent.css({left: event.pageX + $.tooltip.defaults.left, top: event.pageY + $.tooltip.defaults.top});
  }
  function hide(){
    current = null;
    helper.parent.hide();
  }
})(jQuery);