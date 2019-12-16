require 'rails_helper'

RSpec.describe 'Author Show Page' do
  it 'can click an author name on the book index page and be taken to an author show page' do
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

    within("#book-#{pride_prejudice.id}") do
      click_link "#{j_austen.name}"
    end

    expect(current_path).to eq("/authors/#{j_austen.id}")
    expect(page).to have_content(j_austen.name)
    expect(page).to have_content(pride_prejudice.title)
    expect(page).to have_content(sense_sensibility.title)
    expect(page).to have_content('Average number of pages across all books: 403.5')
  end
end

# User Story 2: Author Show Page
#
# As a user,
# When I visit the Book Index Page,
#   Then I see each author's name is a link
# When I click the link
#   Then I am taken to an Author Show Page where I see the author with that id including the author's:
#   - name
#   - the title of each book they have written
#   - the average number of pages for all of their books
