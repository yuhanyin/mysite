class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  # get signup
  def new
    @user = User.new
  end

  # post signup
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "use the url activate : /account_activations/#{@user.activation_token}/edit?email=#{@user.email}"
      # flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # log_in(@user)
      # flash[:success] = "Welcome to the my store!"
      # redirect_to user_url(@user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    # 用户页面展示订单数据分页
    @orders = @user.orders.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @user = User.find(params[:id])
  end

  # patch /
  def update
    @user = User.find(params[:id])
    # 更新成功
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_url(@user)
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def admin_user
    if (!isAdmin)
      flash[:danger] = "permision denied"
      redirect_to(root_url)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    if (!current_user?(@user))
      flash[:danger] = "no permision"
      redirect_to root_url
    end
  end
end
