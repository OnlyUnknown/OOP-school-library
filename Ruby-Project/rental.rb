class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    person.Rental << self

    @book = book
    book.Rental << self
  end
end
