require_relative 'person_class'

class Student < Person
  attr_accessor :parent_permission, :id, :name, :rental
  attr_reader :position

  def initialize(age, _parent_permission, name = 'Unknown')
    super(age, name)
    @position = 'Student'
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
