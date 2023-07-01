class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    pushed = Rental.new(date, person, self)
    @rental.push(pushed)
  end
end
