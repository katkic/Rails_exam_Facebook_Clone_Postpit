class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    set_user
  end

  def new
  end

  def edit
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
  end

  def destroy
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
      :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
