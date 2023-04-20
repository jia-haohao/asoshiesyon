class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update]

  def new
    @user = User.new 
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      UserMailer.user_mail(@user).deliver
      session[:user_id] = @user.id 
      redirect_to user_path(@user.id)
    else
      render :new 
    end
  end

  def ensure_current_user
    if @current_user.id != params[:id].to_i
      redirect_to user_path, notice: "権限がありません"
    end
  end

  def show
  end

  def edit
  end

  def update 
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "更新しました!"
    else
      render :edit
    end
  end

  def destroy 
    @user.destroy 
    redirect_to root_path, notice: "削除しました!"
  end

  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
