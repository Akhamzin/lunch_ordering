FactoryGirl.define do
  factory :user_a do
  		name "admin"
    	email "admin@tst.com"
		password "123456"
		password_confirmation "123456"
		role_id "1"
  end
  factory :user do
  		name "user"
    	email "user@tst.com"
		password "123456"
		password_confirmation "123456"
		role_id "1"
  end
end
