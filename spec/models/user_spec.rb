require 'rails_helper'

RSpec.describe User, type: :model do
    
        it { should have_many(:rooms) }
        it { should have_many(:carts) }
end