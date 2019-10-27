class AccountsController < ApplicationController
  before_action :login_required

  def show
    set_user
  end

  def edit
  end

  def update
  end
end

private

def set_user
  @user = User.find(current_user.id)
end
