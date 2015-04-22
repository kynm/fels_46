require "rails_helper"

RSpec.describe User, :type => :model do

  let(:user) {FactoryGirl.create :user}
  let(:other_user) {FactoryGirl.create :user}
  subject {user}
  
  describe "follow and un follow" do

    context "follow is valid" do
      before do
        user.follow other_user
      end
      subject {user.following? other_user}
      it {is_expected.to be_truthy}
    end

    context "unfollow is valid" do
      before do
        user.follow other_user
        user.unfollow other_user
      end
      subject {user.following? other_user}
      it {is_expected.not_to be_truthy}
    end
  end
end