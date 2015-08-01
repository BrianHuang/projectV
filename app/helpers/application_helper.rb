module ApplicationHelper
  def js(*js_s)
    @js ||= []
    js_s.each do |js_name|
      @js << js_name unless @js.index(js_name)
    end
  end
  def js_load
    return @js.map{|js|javascript_include_tag(js)}.join if @js
  end
  def css(*css_s)
    @css ||= []
    css_s.each do |css_name|
      @css << css_name unless @css.index(css_name)
    end
  end
  def css_load
    return @css.map{|css|stylesheet_link_tag(css,media: "all").join} if @css
  end
  def js_css_load
    return raw (@js || []).map{|js|javascript_include_tag(js)}.join + (@css || []).map{|css|stylesheet_link_tag(css,media: "all")}.join
  end
  
  def pick_c(*set_controller)
    return set_controller.map{|m|"users/admin/#{m}"}.include?(params[:controller]) ? 'active' : nil
  end
  def breadcrumbs_title
    return (@breadcrumbs ||= []).map{|i|i[0]}.join(':')
  end
  def breadcrumbs(ary)#[title , url]
    @breadcrumbs ||= []
    @breadcrumbs << ary
  end
  def show_flash
    ans = ""
    if !flash.empty?
      flash.each do |key, msg|
        ans += msg.is_a?(Array) ? msg.map{|m|flash_package(key , m)}.join : flash_package(key , msg)
      end
    end
    if @flash && @flash.errors.any?
      @flash.errors.full_messages.each do |msg|
        ans += msg.is_a?(Array) ? msg.map{|m|flash_package('error' , m)}.join : flash_package('error' , msg)
      end
    end
    if params[:notice]
      ans += flash_package('info' , params[:notice])
    end
    return raw(ans)
  end
  
  def ckeditor_loader
    js('/admin/javascripts/ckeditor/ckeditor', '/admin/javascripts/ckeditor/adapters/jquery')
    content_for :header do
      raw '<script>jQuery(function($){$("textarea.wysiwyg").ckeditor();})</script>'
    end
  end
  
  def flash_package(key , msg)
    return "<div class='alert alert-block alert-#{h(key)} fade in'><button type='button' class='close' data-dismiss='alert'>×</button><h4 class='alert-heading'>#{h(msg)}</h4></div>"
  end
end
