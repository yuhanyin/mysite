class ProductsController < ApplicationController
  # before_action :accept_all_params

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :body,
      :mileage,
      :engV,
      :engType,
      :registration,
      :year,
      :model,
      :drive
    )
  end

  def count
    res = Product.unscoped.group(:name).count
    render :json => res
  end

  def index
    name = params[:search]
    if (name)
      # case-insensitive search for name
      @products = Product
        .where("lower(name) LIKE lower(?) OR lower(name) LIKE lower(?)", "%#{name}%", "%#{name}%")
        .paginate(page: params[:page], per_page: 10)
      # .where("lower(name) = ?", name.downcase)
      # where("name LIKE '%#{params[:search]}%'")
    else
      @products = Product.where(del: 0).paginate(page: params[:page], per_page: 10)
    end
  end

  # get create new
  def new
    @product = Product.new
  end

  # post create
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:info] = "ok"
    else
      flash[:error] = "create error"
    end
    redirect_to products_url
  end

  # get one product
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  # patch /
  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      flash[:success] = "product updated"
      redirect_to @product
    else
      render "edit"
    end
  end

  def destroy
    # 不是真的删除, 只是修改状态不显示
    flash[:success] = "admin success deleted"
    product = Product.find(params[:id])
    product.del = 1
    product.save!
    redirect_to products_url
  end
end
