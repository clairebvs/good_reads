require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it {should have_many(:reviews)}
    it {should have_many(:books).through(:reviews)}
  end
end
