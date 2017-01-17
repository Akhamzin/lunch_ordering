module ControllerHelpers
	
    def login_1admin
    	before(:each) do
    	  @request.env["devise.mapping"] = Devise.mappings[:user]
	      user = attributes_for(:user_a)
	      #user = FactoryGirl.create(:user)
	      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
	      #sign_in user
	      sign_in user
	    end
	  	
	  end
	def login_user
		before(:each) do
	      @request.env["devise.mapping"] = Devise.mappings[:user]
	      #admin = FactoryGirl.create(:admin)
	      user = FactoryGirl.create(:user)
	      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
	      #sign_in user
	      sign_in user
	    end
	    
	end
end