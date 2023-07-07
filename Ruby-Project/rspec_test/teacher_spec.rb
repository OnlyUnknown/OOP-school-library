require_relative '../teacher_class'

describe Teacher do
  it 'should have a specialization' do
    teacher = Teacher.new(30, 'Specialization')
    expect(teacher.specialization).to eq('Specialization')
  end

  it 'should have a position of Teacher' do
    teacher = Teacher.new(30, 'Specialization')
    expect(teacher.position).to eq('Teacher')
  end

  it 'should be able to use the services' do
    teacher = Teacher.new(30, 'Specialization')
    expect(teacher.can_use_services?).to eq(true)
  end
end
