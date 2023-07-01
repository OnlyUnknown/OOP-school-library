require_relative "student_class"
require_relative "person_class"
require_relative "teacher_class"
require_relative "book"
class App
    attr_accessor :classrooms, :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @classrooms = []
    @rentals = []
  end

  def all_people
    @people.each do |p|
        puts "[#{p.position}]"+" ID: #{p.id}" +  " Name: #{p.name}" + " Age: #{p.age}"
    end
end



def create_student
    puts "The name of the student"
    name = gets.chomp
    puts "The age of the student"
    age = gets.chomp
    puts "The classroom of the student"
    classroom = gets.chomp
    if age < "18"
        puts "Does he have the parent permission [Y/N]"
        parent_permission = gets.chomp

        if parent_permission == 'Y' or parent_permission == "y"
            parent_permission = true
        elsif parent_permission == 'N' or parent_permission == 'n'
            parent_permission = false
        end
    end
        pushed = Student.new(age,classroom,name,parent_permission)
        @people.push(pushed)
    
end

    def create_teacher
        puts "The name of the teacher"
    name = gets.chomp
    puts "The age of the teacher"
    age = gets.chomp
    puts "The speacility of the teacher"
    specialization = gets.chomp
    pushed = Teacher.new(age, specialization, name)
    @people.push(pushed)
    end

    def create_book
        puts "The Title"
        title = gets.chomp
        puts "The Author"
        author = gets.chomp
        pushed = Book.new(title,author)
        @books.push(pushed)
    end
    def create_person
        puts "To add student press 1"
        puts "To add teacher press 2"
        number = gets.chomp
        if number == "1"
            create_student()
        elsif number == "2"
        create_teacher()
        else 
            puts "Invalide number"
        end
        
    end

end




    app = App.new
    app.create_person()
    app.create_person()

    app.all_people()