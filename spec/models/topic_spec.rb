require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) {create(:topic)}
  it {is_expected.to have_many(:bookmarks)}

  describe "attributes" do
    it "has title attributes" do
      expect(topic).to have_attributes(title: topic.title)
    end
  end
end
