require_relative 'student_class'
require_relative 'person_class'
require_relative 'teacher_class'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
class App
  attr_accessor :classrooms, :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @classrooms = []
    @rentals = []
  end

  def all_people
    @people.each_with_index do |p, index|
      puts "#{index})" "[#{p.position}]" + " ID: #{p.id}" + " Name: #{p.name}" + " Age: #{p.age}"
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
    puts 'The classroom of the student'
    classroom = gets.chomp
    if age < '18'
      puts 'Does he have the parent permission [Y/N]'
      parent_permission = gets.chomp

      if %w[Y y].include?(parent_permission)
        parent_permission = true
      elsif %w[N n].include?(parent_permission)
        parent_permission = false
      end
    end
    pushed = Student.new(age, classroom, parent_permission, name)
    @people.push(pushed)
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