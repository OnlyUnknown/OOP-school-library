require_relative 'nameable_class'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @Rental = []
  end

  def can_use_services?
    true if @age >= 18 || @parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    if @age >= 18
      @parent_permission = true
    elsif @age < 18
      @parent_permission = false

    end
  end
end
