require 'rails_helper'

RSpec.describe Room, type: :model do
    
    it { should have_many(:messages) }
    it { should belong_to(:shop) }
    it { should belong_to(:user) }
    describe "validations" do
        describe "#user_id" do
            it { should validate_uniqueness_of(:user_id).scoped_to (:shop_id) }
        end
end
end