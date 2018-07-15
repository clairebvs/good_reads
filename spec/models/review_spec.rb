require 'rails_helper'

describe Review, type: :model do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:book)}
  end
end
