class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  
  protect_from_forgery with: :exception
  def js(*js_s)
    @js ||= []
    js_s.each do |js_name|
      @js << js_name unless @js.include?(js_name)
    end
  end
  def css(*css_s)
    @css ||= []
    css_s.each do |css_name|
      @css << css_name unless @css.include?(css_name)
    end
  end
end