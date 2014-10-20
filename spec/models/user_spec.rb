require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { should have_many(:user_sites) }
    it { should have_many(:sites).through(:user_sites) }
  end
end
