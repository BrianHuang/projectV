class SpecsController < ApplicationController
  before_action :set_spec, only: [:show, :edit, :update, :destroy]

  def index
    @specs = @paginate = Spec.from('specs AS s')
    .joins('LEFT JOIN cates AS c ON s.cate_id = c.id LEFT JOIN cates AS pc ON s.part_cate_id = pc.id')
    .select('s.* , c.name AS cate_name , pc.name AS part_cate_name')
    .paginate(:page => params[:page] , :per_page => 30)
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
    @spec = Spec.new
  end

  def edit
  end

  def create
    @spec = @flash = Spec.new(spec_params)
    
    if @spec.save
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
  end

  def update
    
    if @spec.update(spec_params)
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @spec.destroy
    redirect_to action: 'index'
  end
  
  private
  
    def set_spec
      @spec = Spec.find(params[:id])
    end
    def spec_params
      params.require(:spec).permit(:name,:cate_id,:is_part,:part_cate_id)
    end
end