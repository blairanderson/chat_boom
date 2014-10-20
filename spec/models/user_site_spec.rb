require 'rails_helper'

RSpec.describe UserSite, :type => :model do
  describe "associations" do
    it { should belong_to :site }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:site_id).scoped_to(:user_id)}
  end
end
