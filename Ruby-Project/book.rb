class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, book)
    rental = Rental.new(date, book)
    @rental << rental
    person.add_rental(rental)
  end
end
