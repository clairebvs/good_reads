require 'rails_helper'

describe 'a user visit the index page' do
  it 'user sees all books and titles' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")

      visit books_path

      expect(page).to have_content(book1.title)
      expect(page).to have_content(book2.title)
    end

    it 'can click on a book title and go to the book show page' do
      book1 = Book.create(title: "1, 2, 3")
      book2 = Book.create(title: "Brooklyn Bridge")

      visit books_path

      click_link ("#{book1.title}")

      expect(current_path).to eq(book_path(book1))
  end
end
