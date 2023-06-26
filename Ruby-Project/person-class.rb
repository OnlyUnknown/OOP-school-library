class Person
    attr_reader :name, :id, :age
    attr_writer :name, :age
    def initialize(name = "Unknown", age, parent_permission = true) 
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services?
        if @age >= 18 || @parent_permission === true
            can_use_services = true
        end

        private 
    def of_age?
        if @age >= 18
            @parent_permission = true
        elsif @age < 18
            @parent_permission = false 
        end
    end

