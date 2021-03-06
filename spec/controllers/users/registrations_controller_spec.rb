require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "POST #create" do
    let(:user) { build(:user) }
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

    # it "create a request" do
    #   subject
    #   expect { subject }.to change { User.all.count }.by(1)
    # end
  end
end
