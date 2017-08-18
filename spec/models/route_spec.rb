require 'rails_helper'

RSpec.describe Route, type: :model do

  it { should validate_presence_of(:passphrase_digest) }
  it { should validate_presence_of(:start_node) }
  it { should validate_presence_of(:end_node) }
  it { should validate_presence_of(:source) }
  
end

