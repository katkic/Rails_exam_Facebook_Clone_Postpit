class TopsController < ApplicationController
  skip_before_action :login_required
  before_action :logedin

  def index
    @user = User.new
  end
end
