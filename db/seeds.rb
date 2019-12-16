# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p_coehlo = Author.create(name: 'Paulo Coelho')
j_austen = Author.create(name: 'Jane Austen')
p_coehlo.books.create(title: 'The Alchemist', publication_year: '1988', pages: 204)
p_coehlo.books.create(title: 'The Valkyries', publication_year: '1988', pages: 398)
j_austen.books.create(title: 'Pride and Prejudice', publication_year: '1813', pages: 433)
j_austen.books.create(title: 'Sense and Sensibility', publication_year: '1811', pages: 374)
