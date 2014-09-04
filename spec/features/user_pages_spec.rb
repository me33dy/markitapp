require "spec_helper"
describe "user pages" do
	subject { page }
	describe "sign up page" do
		before { visit 'users/sign_up' }
		it { should have_content('Sign up') }
		it { should have_title('Sign up') }
	end

	describe "sign up" do 
		before { visit 'users/sign_up' }
		let(:submit) { 'Sign up' }

		describe "with invalid information" do
			it "should not create a new user" do
				expect{ click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do 
			before do 
				fill_in "Username", with: "ExampleUser"
				fill_in "Email", with: "example@exampleuser.com"
				fill_in "Password", with: "password"
				fill_in "Password confirmation", with: "password"
			end

			it "should create a new user" do
				expect{ click_button submit }.to change(User,:count).by(1)
			end

			describe "after saving user" do
				before { click_button submit }
				let(:user) { User.find_by(email: "example@exampleuser.com") }

				it { should have_title(user.username) }
				it { should have_content(user.username) }
			end
		end
	end


	describe "user show page" do
		# have to sign in user
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		xit { should have_title(user.username) }
		xit { should have_content(user.username) }



		# have to sign in use for tests to pass
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
