require 'date'
require_relative '../person_class'
require_relative '../book'
require_relative '../rental'

describe Rental do
  let(:person) { Person.new('John Doe') }
  let(:book) { Book.new('Book Title', 'Author Name') }
  let(:date) { Date.today }

  it 'should initialize with a date, person, and book' do
    rental = Rental.new(date, person, book)
    expect(rental.date).to eq(date)
    expect(rental.person).to eq(person)
    expect(rental.book).to eq(book)
  end
end
