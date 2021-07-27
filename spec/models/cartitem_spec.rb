require 'rails_helper'

RSpec.describe CartItem, type: :model do
    
    it { should belong_to(:cart) }
    it { should belong_to(:item) }
 
  describe "validations" do
        describe "#item_id" do
            it { should validate_uniqueness_of(:item_id) }
        end
        
        describe "#count" do
            it { should validate_numericality_of(:count).only_integer }
        end
end
end