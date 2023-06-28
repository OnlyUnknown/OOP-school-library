class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(_student)
    @student.push(Student)
    Student.classroom = self
  end
end
