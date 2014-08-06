require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGril.create(:user) }
  let(:followed) { Factorygirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id)}

  subject { relationship }
  it { should be_valid }
end
