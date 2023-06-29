require_relative "student_class"

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
        puts "Name:" + p.name + "Age:" + p.age
    end
end

    def create_person
        puts "To add student press 1"
        puts "To add teacher press 2"
        number = gets.chomp
        if number == 1
        def create_student
            puts "The name of the student"
            name = gets.chomp
            puts "The age of the student"
            age = gets.chomp
            puts "The classroom of the student"
            classroom = gets.chomp
            if age >= 18
                parent_permission = true
                elsif
                puts "Does he have the parent permission [Y/N]"
                parent_permission = gets.chomp
                end
            if parent_permission == 'Y' || "y"
                parent_permission = true
                elsif parent_permission == 'N' || 'n'
                    parent_permission = false
                end
            people.push(Student(age,classroom,name,parent_permission))
            end
        end
        