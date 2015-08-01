class InventoriesController < ApplicationController
  #before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  
  def index
    @inventories = @paginate = Item.select('id, inv, name, ref_no ').order('is_product DESC,name').paginate(:page => params[:page] , :per_page => 15)
  end
  
  def show
    @inv_entries = @paginate = InvEntry.where("item_id = #{params[:id]}").joins('LEFT JOIN items ON item_id = items.id LEFT JOIN cates on inv_entry_cate_id = cates.id')
    .select('inv_entries.* ,items.name AS item_name, cates.name AS cate_name').paginate(:page => params[:page] , :per_page => 15)
    
    @item = Item.find(params[:id])
  end
  
  # def new
  #   @inventory = InvEntry.new
  # 
  # end
  # 
  # def create
  #   @inventory = @flash = InvEntry.new(inventory_params)
  #   if @inventory.save
  #     redirect_to action: 'index'
  #     flash[:success] = "新增成功"
  #   else
  #     render action: 'new'
  #   end
  #   
  # end
  # 
  # def edit
  #   
  # end
  # 
  # def update
  #   if @inventory.update(inventory_params)
  #     redirect_to action: 'index'
  #     flash[:success] = "更新成功"
  #   else
  #     render action: 'edit'
  #   end
  # end
  # 
  # def show
  # end
  # 
  # def destroy
  #   @item.destroy
  #   redirect_to action: 'index'
  # end
  
  private
  
  def set_inventory
    @inventory = InvEntry.find(params[:id])
  end
  
  def inventory_params
    params.require(:inventory).permit(:date,:item_id,:qty,:inventory_cate_id,:order_id,:note)
  end
  
end
