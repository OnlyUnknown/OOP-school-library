require_relative 'person_class'
class Teacher < Person
  attr_accessor :position
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name)
    @specialization = specialization
    @position = "Teacher"
  end

  def can_use_services?
    @can_use_services = true
  end
end
