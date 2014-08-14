require "spec_helper"

describe Hub do
  it { should have_many(:orders) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
