require "spec_helper"

describe Order do
  it { should belong_to(:hub) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
