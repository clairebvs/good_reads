require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it {should have_many(:user_books)}
    it {should have_many(:books).through(:user_books)}
  end
end
