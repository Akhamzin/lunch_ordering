class UserListController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission, only: [:index]
  def index
  	@users = User.all
  end

  private
  def check_permission
      if current_user.role_id != 1
        redirect_to root_path, alert: 'Permission denied'
      end
    end
end
