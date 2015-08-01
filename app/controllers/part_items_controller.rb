class PartItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @paginate = Item.joins('LEFT JOIN cates ON items.cate_id = cates.id').select('items.* , cates.name AS cate_name').where('items.is_product = false').paginate(:page => params[:page] , :per_page => 15)
  end
  
=begin
(SELECT * ) select
(FROM xxx ) from
(LEFT JOIN nnn ON nnn.id = xxx.nnn_id ) joins
(GROUP BY xxx.nnn_id HAVING xxx.temp = 1) group
(WHERE xxx.age > 18) where
(ORDER BY xxx.id) order
(LIMIT 1) limit
(OFFSET 2) offset
=end
  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @flash = Item.new(item_params)

    if @item.save
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to action: 'index'
  end
  
  private
  
    def set_item
      @item = Item.find(params[:id])
    end
    def item_params
      params.require(:item).permit(:name,:cate_id,:is_product,:unit,:ref_no)
    end
end