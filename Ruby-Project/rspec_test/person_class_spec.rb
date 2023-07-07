require_relative '../book'
require_relative '../person_class'
require_relative '../rental'

describe 'book class methods' do
  before :all do
    @book = Book.new('title', 'auhtor')
    @person = Person.new('2', 'jack')
    @rental = Rental.new('2022/01/01', @person, @book)
  end
  it 'returns the name of the person' do
    expect(@person).to be_instance_of Person
  end
  it 'returns the id must be between 0 and 1000' do
    expect(@person.id).to be_between(0, 1000).inclusive
  end
  it 'returns the persone can use the service' do
    expect(@person.can_use_services?).to be true
  end
  it 'it returns the name of the person' do
    expect(@person.correct_name).to eql 'jack'
  end
  it 'it returns the instance of rentals' do
    rental = @person.add_rental(@book, '2020/08/03')
    expect(rental).to be_instance_of Rental
  end
end
