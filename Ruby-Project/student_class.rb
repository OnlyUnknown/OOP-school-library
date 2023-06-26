require './person_class'
class Student < Person
  def initialize(classroom)
    super(classroom)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
