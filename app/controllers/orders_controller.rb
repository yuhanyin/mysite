class OrdersController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :logged_in_user

  def index
    @orders = Order.paginate(page: params[:page], per_page: 10)
  end

  def new
    @order = Order.new
    @product = Product.find(params[:pid])
    @order.product_id = @product.id
  end

  def create
    product = Product.find(params[:product_id])
    product.orders.create(user: current_user, state: 1)
    flash[:info] = "pay success"
    redirect_to current_user
  end

  def destroy
  end

  def change
    order = Order.find(params[:id])
    user = User.find(order.user_id)
    if (isAdmin)
      order.state = params[:next_state]
      flash[:info] = "success"
      order.save!
      return redirect_to user
    elsif (current_user?(user) && params[:next_state].to_i == 3)
      # 普通用户只能确认自己的收货, url里的next_state可能是字符串， 转成数字类型
      order.state = 3
      order.save!
      flash[:info] = "success"
    else
      flash[:info] = "no access permision"
    end
    redirect_to current_user
  end
end
