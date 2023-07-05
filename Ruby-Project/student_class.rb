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
  def save
    self_json = {id: @id, name: @name, Age: @age, 
    parent_permission: @parent_permission, rental: @rental }.to_json
    open("Ruby-Project/people.json") do |file|
      file.puts self_json
    end
  end
end
