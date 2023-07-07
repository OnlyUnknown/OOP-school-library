require_relative '../classroom'

describe 'Classroom' do
  let(:classroom_label) { 'Class A' }
  let(:student) { double('Student') }

  it 'should initialize with a label' do
    classroom = Classroom.new(classroom_label)
    expect(classroom.label).to eq(classroom_label)
  end

  it 'should add a student to the classroom' do
    classroom = Classroom.new(classroom_label)
    classroom.add_student(student)
    expect(classroom.student).to include(student)
  end
end
