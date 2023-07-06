require_relative "../book"
require_relative "../person_class"
require_relative "../rental"
require_relative "../student_class"

describe "book class methods" do
    before :all do

        @student = Student.new("2","jack")
    end
    it "returns the instance of the class" do
        expect(@student).to be_instance_of Student
    end
    it "returns the position of the student" do
        expect(@student.position).to eql "Student"
    end
    it "it returns ¯(ツ)/¯" do
        expect(@student.parent_permission).to eql true
    end
end