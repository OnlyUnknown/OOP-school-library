require './person_class'
class Teacher < person
  def initialize
    super(@specialization)
    @specialization = specialization
    @can_use_services = true
  end
end
