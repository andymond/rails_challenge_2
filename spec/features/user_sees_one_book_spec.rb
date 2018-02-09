require "rails_helper"

describe "User sees one book" do
  it "displays book title and list of reviews" do
    book = Book.create(title: "title")
    review_1 = book.reviews.create(reviewer: "reviewer 1", body: "review 1")
    review_2 = book.reviews.create(reviewer: "reviewer 2", body: "review 2")
    visit "/books/#{book.id}"

    expect(page).to have_content(book.title)
    expect(page).to have_content(review_1.reviewer)
    expect(page).to have_content(review_2.reviewer)
  end
end