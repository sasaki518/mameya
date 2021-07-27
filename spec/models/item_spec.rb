require 'rails_helper'

RSpec.describe Item, type: :model do
    
    describe "validations" do
        describe "#name" do
            it { should validate_presence_of(:name) }
            it { should validate_length_of(:name).is_at_most(50) }
        end
        
        describe "#description" do
            it { should validate_length_of(:description).is_at_most(200) }
        end
        
        describe "#price" do
            it { should validate_presence_of(:price) }
            it { should validate_numericality_of(:price).only_integer }
        end
        
        describe "#gram" do
            it { should validate_numericality_of(:gram).only_integer }
        end
        
        describe "#roasting" do
            it { should validate_numericality_of(:roasting).only_integer }
        end
        
        describe "#sourness" do
            it { should validate_numericality_of(:sourness).only_integer }
        end
        
        describe "#bitterness" do
            it { should validate_numericality_of(:bitterness).only_integer }
        end
        
        describe "#aroma" do
            it { should validate_numericality_of(:aroma).only_integer }
        end
        
        describe "#body" do
            it { should validate_numericality_of(:body).only_integer }
        end
        
        describe "#aftertaste" do
            it { should validate_numericality_of(:aftertaste).only_integer }
        end
end
end