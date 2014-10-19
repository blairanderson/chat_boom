require 'rails_helper'

RSpec.describe Site, :type => :model do
  describe "validations" do
    it {should validate_presence_of :guid }
  end

  describe "associations" do
    it {should have_many(:user_sites)}
    it {should have_many(:users).through(:user_sites)}
  end
end
