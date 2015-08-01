class InvEntryCatesController < ApplicationController
  before_action :set_cate, only: [:show, :edit, :update, :destroy]

  def index
    @cates = @paginate = Cate.where('is_inv_entry = true').order('`order` , `name`').paginate(:page => params[:page] , :per_page => 15)
  end

  def show
  end

  def new
    @cate = Cate.new
  end

  def edit
  end

  def create
    @cate = @flash = Cate.new(cate_params)

    if @cate.save
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
  end

  def update
    if @cate.update(cate_params)
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @cate.destroy
    redirect_to action: 'index'
  end
  
  private
  
    def set_cate
      @cate = Cate.find(params[:id])
    end
    def cate_params
      params.require(:cate).permit(:name,:is_inv_entry,:order)
    end
end