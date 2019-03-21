require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "POST #create" do
    let!(:user) { create(:user) }
    let(:workstation) { Workstation.create(name: "workstation-test") }

    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    subject do
      post :create, params: { others: { workstation: workstation.id },
                              user: { name: user.name,
                                      email: user.email,
                                      phone_number: user.phone_number,
                                      biography: user.biography } }
    end

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it "create a request" do
      expect(user.request).to eq(Request.last)
      expect(user.request.workstation).to be_an_instance_of(Workstation)
    end
  end
end
