require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) {create(:bookmark)}
  it {is_expected.to belong_to(:topic)}

  describe "attributes" do
    it "has bookmark to have url attribute" do
      expect(bookmark).to have_attributes(url: bookmark.url)
    end
  end
end
