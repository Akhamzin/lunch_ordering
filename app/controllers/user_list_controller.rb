class UserListController < ApplicationController
  def index
  	@users = User.all
  end
end
