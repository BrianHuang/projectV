class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order_items, only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = @paginate = Order.joins('LEFT JOIN countries ON orders.country_id = countries.id').select('orders.* , countries.name AS country_name').paginate(:page => params[:page] , :per_page => 15)
  end
  
  def show
    Rails.logger.debug("!!!!___debug____My object: #{@order_items.inspect}")
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    
    @order = @flash = Order.new(order_params)
    if @order.save
      i = 1
      #Rails.logger.debug("!!!!___debug____My object: #{params[:order_item][:item_id][1].inspect}")
      while(!params[:order_item][:item_id][i].nil?)
        #Rails.logger.debug("!!!!___debug____My object: #{@some_object.inspect}")
        if(!params[:order_item][:item_id][i].empty?)
          
          order_item = OrderItem.new
          order_item.order_id = @order.id 
          order_item.item_id = params[:order_item][:item_id][i]
          order_item.qty = params[:order_item][:qty][i]
          order_item.price = params[:order_item][:price][i]
          if order_item.save
            i = i + 1
          end
        else
          i = i + 1
        end
      end
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      
      i = 1
      #Rails.logger.debug("!!!!___debug____My object: #{params[:order_item][:item_id][1].inspect}")
      while(!params[:order_item][:item_id][i].nil?)
        #Rails.logger.debug("!!!!___debug____My object: #{@some_object.inspect}")
        if(!params[:order_item][:item_id][i].empty?)
          
          order_item = OrderItem.new
          order_item.order_id = @order.id 
          order_item.item_id = params[:order_item][:item_id][i]
          order_item.qty = params[:order_item][:qty][i]
          order_item.price = params[:order_item][:price][i]
          if order_item.save
            i = i + 1
          end
        else
          i = i + 1
        end
      end
      
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to action: 'index'
  end
  
  private
  
    def set_order
      @order = Order.find(params[:id])
    end
    
    def set_order_items
      @order_items = OrderItem.joins("LEFT JOIN items ON items.id = order_items.item_id").select("order_items.* , items.name AS item_name").where("order_id = " + params[:id])
    end
    
    def order_params
      params.require(:order).permit(:name,:country_id,:addr,:phone,:fax,:email,:contact,:note,:customer_id,:co_no,:date)
    end
end