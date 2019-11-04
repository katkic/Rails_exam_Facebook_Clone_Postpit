class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to root_path
  end

  def show
    @user
  end

  def new
    @user = User.new
  end

  def edit
    @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id), notice: '登録が完了しました'
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :email,
      :birthday,
      :sex,
      :password,
      :password_confirmation,
      :image,
      :image_cache
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
