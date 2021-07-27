require 'rails_helper'

RSpec.describe Shop, type: :model do
    
    
    it { should have_many(:items) }
    it { should have_many(:rooms) }
    
    describe "validations" do
        describe "#name" do
            it { should validate_presence_of(:name) }
            it { should validate_length_of(:name).is_at_most(20) }
        end
        
        describe "#address" do
            it { should validate_length_of(:address).is_at_most(50) }
        end
        
        describe "#phonenumber" do
            it { should validate_numericality_of(:phonenumber).only_integer }
        end
        
        describe "#description" do
            it { should validate_length_of(:description).is_at_most(200) }
        end
end
end