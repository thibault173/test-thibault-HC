require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_inclusion_of(:status).in_array(REQUEST_STATES) }
  it { should belong_to(:user) }
  it { should belong_to(:workstation) }
end
