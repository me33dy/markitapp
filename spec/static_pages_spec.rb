require 'spec_helper'
describe "following/follower counts" do 
	let(:other_user) { FactoryGirl.create(:user) }
	let(:user) { FactoryGirl.create(:user) }
	before do
		user.follow!(other_user)
		visit user_path
	end

	it { should have_link("1 following", href: following_user_path(user)) }
	it { should have_link("0 followers", href: follower_user_path(user)) }

end