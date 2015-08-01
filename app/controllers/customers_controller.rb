class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = @paginate = Customer.joins('LEFT JOIN countries ON customers.country_id = countries.id').select('customers.* , countries.name AS country_name').paginate(:page => params[:page] , :per_page => 15)
    Rails.logger.debug("!!!!___debug____My object: #{@customers.inspect}")
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
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = @flash = Customer.new(customer_params)

    if @customer.save
      redirect_to action: 'index'
      flash[:success] = "新增成功"
    else
      render action: 'new'
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to action: 'index'
      flash[:success] = "更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to action: 'index'
  end
  
  def customer_data
    customer = Customer.find(params[:id])
    ans = {}
    # ans[:id] = @customer.id
    
    ans = customer.attributes.slice('name','country_id','addr','contact','email','phone','fax')
    render :json => ans
  end  # 
  # <%= f.input :addr , :label => "地址" %>
  # <%= f.input :contact, :label => "聯絡人" %>
  # <%= f.input :email, :label => "E-mail" %>
  # <%= f.input :phone, :label => "電話" %>
  # <%= f.input :fax, :label => "傳真" %>
  private
  
    def set_customer
      @customer = Customer.find(params[:id])
    end
    def customer_params
      params.require(:customer).permit(:name,:country_id,:addr,:phone,:fax,:email,:contact,:note)
    end
end