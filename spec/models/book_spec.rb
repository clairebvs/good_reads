require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it {should have_many(:user_books)}
    it {should have_many(:users).through(:user_books)}
  end

  describe 'instance method' do
    it 'should calculate average rating per book' do
      book1 = Book.create(title: "1, 2, 3")
      user1 = User.create(name: "Elena", review: "Fantastic", rating: 5)
      user2 = User.create(name: "John", review: "Difficult start", rating: 2)
      UserBook.create(book_id: book1.id, user_id: user1.id)
      UserBook.create(book_id: book1.id, user_id: user2.id)

      expected_result = 3.5

      expect(book1.average_rating).to eq(expected_result)
    end
  end
end
