class InvEntriesController < ApplicationController
  before_action :set_inv_entry, only: [:show, :edit, :update, :destroy]
  def index
    @inv_entries = @paginate = InvEntry.joins('LEFT JOIN items ON item_id = items.id LEFT JOIN cates on inv_entry_cate_id = cates.id')
    .select('inv_entries.* ,items.name AS item_name, cates.name AS cate_name').paginate(:page => params[:page] , :per_page => 15)
  end
  
  def new
    @inv_entry = InvEntry.new
    #if params[:item_id]
      @inv_entry.item_id = params[:item_id]
      #end
  end
  
  def create
    @inv_entry = @flash = InvEntry.new(inv_entry_params)
    if @inv_entry.save
      
      item = Item.find(inv_entry_params[:item_id])
      item.inv += inv_entry_params[:qty].to_i
      item.inv_entry_id = @inv_entry.id
      
      Rails.logger.debug("My object: #{@item.inspect}")
      
      item.save
      
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @inv_entry.update(inv_entry_params)
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @inv_entry.destroy
    redirect_to action: 'index'
  end
  
  private
  
  def set_inv_entry
    @inv_entry = InvEntry.find(params[:id])
  end
  
  def inv_entry_params
    params.require(:inv_entry).permit(:date,:item_id,:qty,:inv_entry_cate_id,:order_id,:note)
  end
  
end
