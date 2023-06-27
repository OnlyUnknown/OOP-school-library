require './nameable_class'
class  Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if @age >= 18 || @parent_permission == true
  end

  private

  def of_age?
    if @age >= 18
      @parent_permission = true
    elsif @age < 18
      @parent_permission = false

    end
  end

  def correct_name
    @name
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end
  def correct_name 
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def 
    if super.size > 10
      def correct_name
        super[0..10]
      end
    end
  end


