require 'rails_helper'

describe 'a user visit the show page book' do
  it 'user sees book title and review and name of user' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")
      user1 = User.create(name: "Elena", review: "Fantastic", rating: 5)
      user2 = User.create(name: "John", review: "Difficult start", rating: 2)
      UserBook.create(book_id: book1.id, user_id: user1.id)
      UserBook.create(book_id: book1.id, user_id: user2.id)

      visit book_path(book1)

      expect(page).to have_content(book1.title)
      expect(page).to have_content(user1.review)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.review)
      expect(page).to have_content(user2.name)
    end

    it 'user can see average rating' do
      book1 = Book.create(title: "1, 2, 3")
      user1 = User.create(name: "Elena", review: "Fantastic", rating: 5)
      user2 = User.create(name: "John", review: "Difficult start", rating: 2)
      UserBook.create(book_id: book1.id, user_id: user1.id)
      UserBook.create(book_id: book1.id, user_id: user2.id)

      visit book_path(book1)

      expected_result = 3.5

      expect(page).to have_content(expected_result)
    end
  end
