require 'rails_helper'

RSpec.describe Workstation, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:requests) }
end
