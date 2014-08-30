require "spec_helper"
describe "user pages" do
	subject { page }
	describe "sign up page" do
		before { visit 'users/sign_up' }
		it { should have_content('Sign up') }
		it { should have_title('Sign up') }
	end


	describe "user show page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		it { should have_content(user.username) }
		it { should have_title(user.username) }



		# need to enhance better for later.
		describe "following/follower counts" do 
			let(:other_user) { FactoryGirl.create(:user) }
			
			before do
				user.follow!(other_user)
				visit user_path(user)
			end
			# could not detect anything from partials
			xit { should have_link("1 following", href: following_user_path(user)) }
			xit { should have_link("0 followers", href: followers_user_path(user)) }

		end
	end
end
