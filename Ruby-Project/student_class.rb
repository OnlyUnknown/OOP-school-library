require_relative 'person_class'
class Student < Person
  attr_reader :classroom
  attr_accessor :position

  def initialize(age, classroom, _parent_permission, name = 'Unknown')
    super(age, name)
    @classroom = classroom
    @position = 'Student'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
