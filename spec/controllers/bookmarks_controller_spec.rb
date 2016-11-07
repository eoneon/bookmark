require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:topic) { create(:topic) }
  let(:bookmark) { create(:bookmark, topic: topic) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to render_template :show
    end

    it "assigns bookmark to @bookmark" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(assigns(:bookmark)).to eq(bookmark)
    end
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    describe "GET new" do
      it "returns http success" do
        get :new, topic_id: topic.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, topic_id: topic.id
        expect(response).to render_template :new
      end

      it "instantiates @bookmark" do
        get :new, topic_id: topic.id
        expect(assigns(:bookmark)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Bookmarks by 1" do
        expect { post :create, topic_id: topic.id, bookmark: { url: RandomData.random_word} }.to change(Bookmark,:count).by(1)
      end

      it "assigns the new bookmark to @bookmark" do
        expect  post :create, topic_id: topic.id, bookmark: { url: RandomData.random_word }
        expect(assigns(:bookmark)).to eq Bookmark.last
      end

      it "redirects to the new bookmark" do
        post :create, topic_id: topic.id, bookmark: { url: RandomData.random_word }
        expect(response).to redirect_to [topic, Bookmark.last]
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, topic_id: topic.id, id: bookmark.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, topic_id: topic.id, id: bookmark.id
        expect(response).to render_template :edit
      end

      it "assigns bookmark to be updated to @bookmark" do
        get :edit, topic_id: topic.id, id: bookmark.id

        bookmark_instance = assigns(:bookmark)

        expect(bookmark_instance.id).to eq bookmark.id
        expect(bookmark_instance.url).to eq bookmark.url
      end
    end

    describe "PUT update" do
      it "updates bookmark with expected attributes" do
        new_url = RandomData.random_word

        put :update, topic_id: topic.id, id: bookmark.id, bookmark: { url: new_url }

        updated_bookmark = assigns(:bookmark)
        expect(updated_bookmark.id).to eq bookmark.id
        expect(updated_bookmark.url).to eq new_url
      end

      it "redirects to the updated bookmark" do
        new_url = RandomData.random_word

        put :update, topic_id: topic.id, id: bookmark.id, bookmark: { url: new_url }
        expect(response).to redirect_to [topic, bookmark]
      end
    end

    describe "DELETE destroy" do
      it "deletes the bookmark" do
        delete :destroy, topic_id: topic.id, id: bookmark.id
        count = Bookmark.where({id: bookmark.id}).size
        expect(count).to eq 0
      end

      it "redirects to bookmarks show" do
        delete :destroy, topic_id: topic.id, id: bookmark.id
        expect(response).to redirect_to topic
      end
    end
  end
end
