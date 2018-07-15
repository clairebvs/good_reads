require 'rails_helper'

describe 'a user visit the show page book' do
  it 'user sees book title and review and name of user' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")
      user1 = User.create(name: "Elena")
      user2 = User.create(name: "John")
      review1 = Review.create(book_id: book1.id, user_id: user1.id, comment: "Great book", rating: 5)
      review2 = Review.create(book_id: book1.id, user_id: user2.id, comment: "The beginning is long", rating: 2)

      visit book_path(book1)

      expect(page).to have_content(book1.title)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(review1.comment)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(review2.comment)
    end

    it 'user sees rating for a book by each user' do
        book1 = Book.create(title: "1, 2, 3")
        book2 = Book.create(title: "Brooklyn Bridge")
        user1 = User.create(name: "Elena")
        user2 = User.create(name: "John")
        review1 = Review.create(book_id: book1.id, user_id: user1.id, comment: "Great book", rating: 5)
        review2 = Review.create(book_id: book1.id, user_id: user2.id, comment: "The beginning is long", rating: 2)

        visit book_path(book1)

        expect(page).to have_content(book1.title)
        expect(page).to have_content(user1.name)
        expect(page).to have_content(review1.comment)
        expect(page).to have_content(review1.rating)
        expect(page).to have_content(user2.name)
        expect(page).to have_content(review2.rating)
    end

    it 'user can see average rating' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")
      user1 = User.create(name: "Elena")
      user2 = User.create(name: "John")
      review1 = Review.create(book_id: book1.id, user_id: user1.id, comment: "Great book", rating: 5)
      review2 = Review.create(book_id: book1.id, user_id: user2.id, comment: "The beginning is long", rating: 2)

      visit book_path(book1)

      expected_result = 3.5

      expect(page).to have_content(expected_result)
    end

    it 'user can see highest rating for a book' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")
      user1 = User.create(name: "Elena")
      user2 = User.create(name: "John")
      review1 = Review.create(book_id: book1.id, user_id: user1.id, comment: "Great book", rating: 5)
      review2 = Review.create(book_id: book1.id, user_id: user2.id, comment: "The beginning is long", rating: 2)

      visit book_path(book1)

      expect(page).to have_content("Highest rating : #{review1.rating}")
    end
  end
