class UsersController < ApplicationController
  skip_before_action :login_required
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
    set_user
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
    set_user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    set_user
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
      :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
