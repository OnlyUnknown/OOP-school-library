require "./Person-class.ru"
class Teacher < person
def initialize(specialization)
    @specialization = specialization
    @can_use_services = true
end