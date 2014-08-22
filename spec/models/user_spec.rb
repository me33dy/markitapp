require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it { should respond_to(:bookmarks) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }



  describe "following" do
  	let(:other_user) { FactoryGirl.create(:user)}
  	before do
  		user.save
  		user.follow!(other_user)
  	end

  	it { should be_following(other_user) }
  	its(:followed_users) { should include(other_user) }

  	describe "and unfollowing" do
  		before { user.unfollow!(other_user) }

  		it { should_not be_following(other_user) }
  		its(:followed_users) { should_not include(other_user) }
  	end

  	describe "followed user" do
  		subject { other_user }
  		its(:followers) { should include(user) }
  	end
  end
end
