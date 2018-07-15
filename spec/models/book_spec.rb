require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it {should have_many(:reviews)}
    it {should have_many(:users).through(:reviews)}
  end

  describe 'instance method' do
    it 'should calculate average rating per book' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")
      user1 = User.create(name: "Elena")
      user2 = User.create(name: "John")
      review1 = Review.create(book_id: book1.id, user_id: user1.id, comment: "Great book", rating: 5)
      review2 = Review.create(book_id: book1.id, user_id: user2.id, comment: "The beginning is long", rating: 2)

      expected_result = 3.5

      expect(book1.average_rating).to eq(expected_result)
    end
  end
end
