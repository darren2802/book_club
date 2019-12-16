require 'rails_helper'

RSpec.describe 'Book Index Page' do
  it 'can see each book in the system and its details when visiting /books' do
    p_coehlo = Author.create(name: 'Paulo Coelho')
    j_austen = Author.create(name: 'Jane Austen')
    the_alchemist = Book.create(title: 'The Alchemist', publication_year: '1988', pages: 204)
    the_valkyries = Book.create(title: 'The Valkyries', publication_year: '1988', pages: 398)
    pride_prejudice = Book.create(title: 'Pride and Prejudice', publication_year: '1813', pages: 433)
    sense_sensibility = Book.create(title: 'Sense and Sensibility', publication_year: '1811', pages: 374)

    p_coehlo.books << the_alchemist
    p_coehlo.books << the_valkyries
    j_austen.books << pride_prejudice
    j_austen.books << sense_sensibility

    visit '/books'

    within("#book-#{the_alchemist.id}") do
      expect(page).to have_content(the_alchemist.title)
      expect(page).to have_content(the_alchemist.pages)
      expect(page).to have_content(the_alchemist.publication_year)
      expect(page).to have_content(p_coehlo.name)
    end
  end
end


# User Story 1: Book Index Page
#
# As a user,
# When I visit '/books'
# Then I see each book in the system including the book's:
#   - title
#   - number of pages
#   - publication year
#   - the name of each author that wrote the book
