class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :set_role

  private

  def set_role
  	if User.first.present?
  		self.isAdmin = false
  	else
  		self.isAdmin = true
  	end
  end

end
