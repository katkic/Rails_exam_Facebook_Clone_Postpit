class TopsController < ApplicationController
  skip_before_action :login_required

  def index
    @user = User.new
  end
end
