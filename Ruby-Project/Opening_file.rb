require_relative "book"
require_relative "person_class"
require_relative "student_class"
require_relative "teacher_class"

require 'json'

def fetch_data(file)
    if File.exist?("Ruby-Project/#{file}.json")
      File.read("Ruby-Project/#{file}.json")
    else
      empty_json = [].to_json
      File.write("Ruby-Project/#{file}.json", empty_json)
      empty_json
    end
  end

  def save_book(data)
    updated_books = []

    data.each do |book|
      updated_books << { 'title' => book.title, 'author' => book.author }
    end

    File.write('Ruby-Project/books.json', JSON.pretty_generate(updated_books))
  end

  def save_people(data)
    updated_people = []

    data.each do |person|
      if person.instance_of?(::Teacher)
        updated_people << { 'type' => 'Teacher', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'specialization' => person.specialization }
      elsif person.instance_of?(::Student)
        updated_people << { 'type' => 'Student', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'parent_permission' => person.parent_permission }
      end
    end

    File.write('Ruby_Project/people.json', JSON.pretty_generate(updated_people))
  end

  def save_rentals(data)
    updated_rentals = []

    data.each do |rental|
      updated_rentals << { 'person_name' => rental.person.name, 'book_title' => rental.book.title,
                           'date' => rental.date }
    end

    File.write('Ruby-Project/rentals.json', JSON.pretty_generate(updated_rentals))
  end

# def load(file,list,init)
#     list = JSON.parse(fetch_data(file))
#     if init == @books
#         list.each do |book|
#         @init << Book.new(book['title'], book['author'])
#           end
#         elsif init == @person
#             people.each do |person|
#             init << if person['position'] == 'Teacher'
#                              Teacher.new(person['age'], person['specialization'], person['name'])
#                            else
#                              Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
#                            end
#               end
#             else 
#                 rentals.each do |rental|
#                     rentee = @people.find { |person| person.name == rental['person_name'] }
#                     rented_book = @books.select { |book| book.title == rental['book_title'] }
#                 init << Rental.new(rental['date'], rented_book[0], rentee)
#                   end
#                 end
#             end