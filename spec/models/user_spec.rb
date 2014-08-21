require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it { should respond_to(:bookmarks) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
end
