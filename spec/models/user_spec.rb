require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "#like(bookmark)" do
    before do
      topic = Topic.create!(title: RandomData.random_word)
      @bookmark = topic.bookmarks.create!(url: RandomData.random_word, user: user)
    end

    it "returns 'nil' if the user has not liked the bookmark" do
      expect(user.liked(@bookmark)).to be_nil
    end

    it "returns the appropriate like if it exists" do
      like = user.bookmarks.where(bookmark: @bookmark).create
      expect(user.liked(@bookmark)).to eq(bookmark)
    end
  end
end
