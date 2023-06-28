class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    Person.Rental << self

    @book = book
    Book.Rental << self
  end
end
