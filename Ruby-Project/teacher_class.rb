require_relative 'person_class'

class Teacher < Person
  attr_accessor :position, :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    @position = 'Teacher'
  end

  def can_use_services?
    @can_use_services = true
  end
end
