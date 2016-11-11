require 'rails_helper'

RSpec.describe IncomingController, type: :controller do
  let(:user) { create(:user) }
  let(:topic) { build(:topic) }
  let(:bookmark) { build(:bookmark) }

  describe "incoming action" do
    let(:request) { post :incoming, {from: user.email, subject: topic.title, 'stripped-text' => bookmark.url} }

    it "responds with success" do
      request
      expect(response).to have_http_status(200)
    end

    context 'for an email that belongs to a user we know about' do
      it "creates a bookmark" do
        before = Bookmark.count
        request
        after = Bookmark.count
        expect(after).to eq(before + 1)
      end

      it "creates a bookmark for that user" do
        before = user.bookmarks.count
        request
        after = user.bookmarks.count
        expect(after).to eq(before + 1)
      end

      context 'for a topic that does not yet exist' do
        it 'creates the topic' do
          request
          expect(Topic.last.title).to eq(topic.title)
        end

        it 'assigns the bookmark to that topic' do
          request
          expect(Bookmark.last.topic).to eq(Topic.last)
        end
      end
    end

    # context 'for an email that we dont know about' do
    #   it "does not create a bookmark" do
    #   end
    # end
  end
end
