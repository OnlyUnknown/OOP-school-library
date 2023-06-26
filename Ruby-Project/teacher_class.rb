require './person_class'
class Teacher < person
  def initialize(specialization, _can_use_services)
    super(specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
