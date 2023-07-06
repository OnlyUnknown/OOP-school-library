require_relative 'student_class'
require_relative 'person_class'
require_relative 'teacher_class'
require_relative 'book'
require_relative 'rental'
require_relative 'opening_file'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def load_data
    books = JSON.parse(fetch_data('Books'))
    people = JSON.parse(fetch_data('people'))
    rentals = JSON.parse(fetch_data('rentals'))

    books.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
    people.each do |person|
      @people << if person['position'] == 'Teacher'
                   Teacher.new(person['age'], person['specialization'], person['name'])
                 else
                   Student.new(person['age'], parent_permission: person['parent_permission'], name: person['name'])
                 end
    end

    rentals.each do |rental|
      rentee = @people.find { |person| person.name == rental['person_name'] }
      rented_book = @books.select { |book| book.title == rental['book_title'] }
      @rentals << Rental.new(rental['date'], rented_book[0], rentee)
    end
  end

  def save_book
    updated_books = []

    @books.each do |book|
      updated_books << { 'title' => book.title, 'author' => book.author }
    end

    File.write('Ruby-Project/books.json', JSON.pretty_generate(updated_books))
  end

  def save_people
    updated_people = []

    @people.each do |person|
      if person.instance_of?(::Teacher)
        updated_people << { 'position' => 'Teacher', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'specialization' => person.specialization }
      elsif person.instance_of?(::Student)
        updated_people << { 'position' => 'Student', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'parent_permission' => person.parent_permission }
      end
    end

    File.write('Ruby-Project/people.json', JSON.pretty_generate(updated_people))
  end

  def save_rentals
    updated_rentals = []

    @rentals.each do |rental|
      updated_rentals << { 'person_name' => rental.person.name, 'book_title' => rental.book.title,
                           'date' => rental.date }
    end

    File.write('Ruby-Project/rentals.json', JSON.pretty_generate(updated_rentals))
  end

  def all_people
    @people.each_with_index do |pe, index|
      puts "#{index})" + "[#{pe.position}]" + " ID: #{pe.id}" + " Name: #{pe.name}" + " Age: #{pe.age}"
    end
  end

  def all_books
    @books.each_with_index do |b, index|
      puts "#{index})" + "Title: #{b.title}" + " Author: #{b.author}"
    end
  end

  def books_rented
    all_people
    puts 'Chose the person by id'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    puts "Rentals for Person ID #{person_id}:"
    person.rental.each do |rental|
      puts "Date: #{rental.date}, Book Title: #{rental.book.title}, By: #{rental.book.author} "
    end
  end

  def create_student
    puts 'The name of the student'
    name = gets.chomp
    puts 'The age of the student'
    age = gets.chomp
    if age < "18"
      puts 'Does he have the parent permission [Y/N]'
      parent_permission = gets.chomp

      if %w[Y y].include?(parent_permission)
        parent_permission = true
      elsif %w[N n].include?(parent_permission)
        parent_permission = false
      end
    end
    pushed = Student.new(age, parent_permission, name)
    @people << pushed
    puts 'Student has been added'
  end

  def create_teacher
    puts 'The name of the teacher'
    name = gets.chomp
    puts 'The age of the teacher'
    age = gets.chomp
    puts 'The speacility of the teacher'
    specialization = gets.chomp

    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher has been added'
  end

  def create_book
    puts 'The Title'
    title = gets.chomp
    puts 'The Author'
    author = gets.chomp
    pushed = Book.new(title, author)
    @books.push(pushed)
    puts 'Book has been added'
  end

  def create_person
    puts 'To add student press 1'
    puts 'To add teacher press 2'
    number = gets.chomp
    if number == '1'
      create_student
    elsif number == '2'
      create_teacher
    else
      puts 'Invalide number'
    end
  end

  def create_rental
    puts 'Select the books by the index number'
    all_books

    book_index = gets.chomp.to_i

    puts 'Chose the person by index number'
    all_people
    person_index = gets.chomp.to_i

    puts 'Select the date'
    rental_date = gets.chomp
    pushed = Rental.new(rental_date, @people[person_index], @books[book_index])
    @rentals.push(pushed)
    puts 'Rental has been added'
  end
end

def show_menu
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def select_option(selected, app)
  case selected
  when 1
    app.all_books
  when 2
    app.all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.books_rented
  else
    puts 'Invalid input'
  end
end

def main
  app = App.new
  app.load_data
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    selected = gets.chomp.to_i
    break if selected == 7

    select_option(selected, app)
  end
  # rentals_data = JSON.generate(@rentals)
  # puts @books
  app.save_people
  app.save_book
  app.save_rentals

  puts 'Thank you for using this app!'
end
