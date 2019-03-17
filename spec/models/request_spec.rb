require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_inclusion_of(:status).in_array(REQUEST_STATES) }
  it { should belong_to(:user) }
  it { should belong_to(:workstation) }

  context "when unconfirmed user" do
    let(:request) { create(:request, :unconfirmed) }

    it "appears in scope unconfirmed" do
      Request.unconfirmed.should include(request)
    end

    it "not appears in scope confirmed" do
      Request.confirmed.should_not include(request)
    end

    it "not appears in scope accepted" do
      Request.accepted.should_not include(request)
    end
  end

  context "when confirmed user" do
    let(:request) { create(:request, :confirmed) }

    it "not appears in scope unconfirmed" do
      Request.unconfirmed.should_not include(request)
    end

    it "appears in scope confirmed" do
      Request.confirmed.should include(request)
    end

    it "not appears in scope accepted" do
      Request.accepted.should_not include(request)
    end
  end

  context "when confirmed accepted" do
    let(:request) { create(:request, :accepted) }

    it "not appears in scope unconfirmed" do
      Request.unconfirmed.should_not include(request)
    end

    it "appears in scope confirmed" do
      Request.confirmed.should_not include(request)
    end

    it "not appears in scope accepted" do
      Request.accepted.should include(request)
    end
  end

  context "when Client accept!" do
    let(:request1) { create(:request, :unconfirmed) }
    let(:request2) { create(:request, :confirmed) }

    before do
      request1.accept!
      request2.accept!
    end

    it "return if not acceptable" do
      expect(request1.status).to eq("pending")
      expect(request1.signature_date).to eq(nil)
    end

    it "change status" do
      expect(request2.status).to eq("accepted")
    end

    it "write signature_date" do
      expect(request2.signature_date).to eq(Date.today)
    end
  end
end
