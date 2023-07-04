require_relative 'student_class'
require_relative 'person_class'
require_relative 'teacher_class'
require_relative 'book'
require_relative 'rental'
require_relative 'Opening_file'
require 'json'


class App
  attr_accessor :people, :books, :rentals


  puts @finalbooksO
  def initialize

    
    booksoutput = File.read('Ruby-Project/Books.json')
    peopleoutput = File.read('Ruby-Project/people.json')
    rentalsoutput = File.read('Ruby-Project/rentals.json')

    if File.empty?('Ruby-Project/people.json')
     @people = []
    else 
      @people = JSON.parse(peopleoutput)
    end
    @books = JSON.parse(booksoutput)
    @rentals = JSON.parse(rentalsoutput)
  end
 


  def all_people
    @people.each_with_index do |pe, index|
      puts "#{index})" + " ID: #{pe['id']}" + " Name: #{pe['name']}" + " Age: #{pe['Age']}"
    end
  end

  def all_books
 
    @books.each_with_index do |b, index|
      puts "#{index})" + "Title: #{b["title"]}" + " Author: #{b["author"]}"
    end
  end

  def books_rented
    all_people
    puts 'Chose the person by id'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    puts "Rentals for Person ID #{person_id}:"
    person.rental.each do |rental|
      puts "Date: #{rental['date']}, Book Title: #{rental['book']['title']}, By: #{rental['book']['author']} "
    end
  end

  def create_student
    puts 'The name of the student'
    name = gets.chomp
    puts 'The age of the student'
    age = gets.chomp
    if age < '18'
      puts 'Does he have the parent permission [Y/N]'
      parent_permission = gets.chomp

      if %w[Y y].include?(parent_permission)
        parent_permission = true
      elsif %w[N n].include?(parent_permission)
        parent_permission = false
      end
    end
    pushed = Student.new(age, parent_permission, name)
    p pushed.id
    student = "Student"

     json = {"id" => pushed.id ,"position" => student, "Age" => age, "name" => name}
    writeFile("people.json", json)

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
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    selected = gets.chomp.to_i
    break if selected == 7

    select_option(selected, app)
  end
  # rentals_data = JSON.generate(@rentals)
  # puts @books


  puts 'Thank you for using this app!'
end
