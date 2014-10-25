require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "title" do
    it "should return the title" do
      expect(helper.title).to eq "ChatBoom"
    end
  end
end
