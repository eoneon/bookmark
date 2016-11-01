# require 'rails_helper'
#
# RSpec.describe UsersController, type: :controller do
#
#   describe "GET #show" do
#     let(:factory_user) {create(:user)}
#
#     it "returns http success" do
#       get :show, {id: factory_user.id}
#       expect(response).to have_http_status(:success)
#     end
#
#     it "renders the #show view" do
#       get :show, {id: factory_user.id}
#       expect(response).to render_template :show
#     end
#
#     it "assigns factory_user to @user" do
#       get :show, {id: factory_user.id}
#       expect(assigns(:user)).to eq(user)
#     end
#   end
# end
