FactoryGirl.define do 
	factory :user do 
		sequence(:username) { |n| "person #{n}" }
		sequence(:email) { |n| "person_#{n}@sample.com"}
		password "testtest"
		password_confirmation "testtest"
	end
end