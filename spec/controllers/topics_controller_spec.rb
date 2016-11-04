require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:topic) {create(:topic)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Topic.all to topic" do
      get :index
      expect(assigns(:topics)).to eq([topic])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: topic.id}
      expect(response).to render_template :show
    end

    it "assigns topic to @topic" do
      get :show, {id: topic.id}
      expect(assigns(:topic)).to eq(topic)
    end
  end

  context 'when signed in' do
    before { sign_in(create(:user)) }

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, topic: {title: RandomData.random_sentence}
        expect(response).to redirect_to Topic.last
      end
    end

    describe "GET edit" do
      it "render the edit page" do
        get :edit, {id: topic.id}
        expect(response).to render_template(:edit)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_title = RandomData.random_sentence

        put :update, id: topic.id, topic: {title: new_title}
        expect(response).to redirect_to(topic)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, {id: topic.id}
        expect(response).to redirect_to(topics_path)
      end
    end
  end

  # context 'when not signed in' do
  #   describe "GET new" do
  #     it "returns http redirect" do
  #       get :new
  #       expect(response).to redirect_to(topics_path)
  #     end
  #   end
  #
  #   describe "POST create" do
  #     it "returns http redirect" do
  #       post :create, topic: {title: RandomData.random_sentence}
  #       expect(response).to redirect_to(topics_path)
  #     end
  #   end
  #
  #   describe "GET edit" do
  #     it "returns http redirect" do
  #       get :edit, {id: topic.id}
  #       expect(response).to redirect_to(topics_path)
  #     end
  #   end
  #
  #   describe "PUT update" do
  #     it "returns http redirect" do
  #       new_title = RandomData.random_sentence
  #
  #       put :update, id: topic.id, topic: {title: new_title}
  #       expect(response).to redirect_to(topics_path)
  #     end
  #   end
  #
  #   describe "DELETE destroy" do
  #     it "returns http redirect" do
  #       delete :destroy, {id: topic.id}
  #       expect(response).to redirect_to(topics_path)
  #     end
  #   end
  # end
end
