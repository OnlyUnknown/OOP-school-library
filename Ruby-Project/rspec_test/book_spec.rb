require_relative '../book'
require_relative '../person_class'
require_relative '../rental'
describe 'book class methods' do
  before :all do
    @book = Book.new('title', 'auhtor')
    @person = Person.new('33', 'jack')
    @rental = Rental.new('2022/01/01', @person, @book)
  end

  it 'returns the new object' do
    expect(@book).to be_instance_of Book
  end
  it 'returns the name of the book' do
    expect(@book.title).to eql 'title'
  end
  it 'return the books has been rented' do
    expect(@rental.book.title).to eql 'title'
  end
  it 'return the books has been rented' do
    expect(@rental.person.name).to eql 'jack'
  end
end
