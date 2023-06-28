class classroom
    attr_accessor :label
    def initialize(label)
        @label = label
        @Student = []
    end
    def add_student(Student)
        @Student.push(Student)
        Student.classroom = self
    end
end