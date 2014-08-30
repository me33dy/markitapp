require 'spec_helper'
describe "static pages" do
	let(:base_title) { "Markit" }
	describe "welcome page" do
		it "should have content 'Welcome'" do
			visit root_path
			expect(page).to have_content('Welcome')
		end
		it "should have title 'Welcome'" do
			visit root_path
			expect(page).to have_title("#{base_title} | Welcome")
		end
	end




	describe "following/follower counts" do 
		let(:other_user) { FactoryGirl.create(:user) }
		let(:user) { FactoryGirl.create(:user) }
		before do
			user.follow!(other_user)
			visit user_path(user)
		end

		xit { should have_link("1 following", href: following_user_path(user)) }
		xit { should have_link("0 followers", href: followers_user_path(user)) }

	end
end