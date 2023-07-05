require_relative 'book'
require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'

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
