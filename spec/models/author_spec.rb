require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :book_authors}
    it {should have_many(:books).through(:book_authors)}
  end

  describe 'methods' do
    it 'can return average number of pages across all its books' do
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

      expect(j_austen.avg_pages).to eq(403.5)
    end
  end
end
