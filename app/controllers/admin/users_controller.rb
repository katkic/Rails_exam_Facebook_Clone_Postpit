class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user),
          notice: "ユーザー「#{@user.last_name + ' ' + @user.first_name}」を登録しました"
    else
      render :new
    end
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
      :image
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
