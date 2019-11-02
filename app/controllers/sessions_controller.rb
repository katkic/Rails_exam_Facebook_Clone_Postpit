class SessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(email: session_params[:email].downcase)

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'ログインしました'
    else
      redirect_to new_session_path, notice: 'ログインに失敗しました'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
