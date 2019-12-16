class Book < ApplicationRecord
  validates_presence_of :title, :publication_year, :pages

  has_many :book_authors
  has_many :authors, through: :book_authors
end
