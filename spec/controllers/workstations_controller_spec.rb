require 'rails_helper'

RSpec.describe WorkstationsController, type: :controller do
  let(:user) { create(:user, :confirmed) }
  let(:workstation) { Workstation.create(name: "Test") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :show, params: { id: workstation.id }
      expect(response).to have_http_status(:success)
    end
  end
end
