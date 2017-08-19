require 'rails_helper'

RSpec.describe Route, type: :model do
  
  before :each do
    @route = FactoryGirl.create(:route)
  end
  
  it { should validate_presence_of(:passphrase_digest) }
  it { should validate_presence_of(:start_node) }
  it { should validate_presence_of(:end_node) }
  it { should validate_presence_of(:source) }
  
  describe "has a correct ISO 8601 UTC" do
    
    it "should has a correct ISO 8601 UTC start_time and end_time" do
        
      expect(@route.start_time).to eq "2010-09-06T12:27:00"
      expect(@route.end_time).to eq "2010-10-06T11:22:02"
      
    end
  
  end
  
  describe "has crypted passphrase" do
    
    let(:check_passphrase) { @route.passphrase == "my new password" }
    specify { expect(check_passphrase).to be(true) }

  end
  
end

