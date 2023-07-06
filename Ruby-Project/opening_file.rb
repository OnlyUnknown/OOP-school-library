require_relative 'book'
require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'

require 'json'

def fetch_data(file)
  if File.exist?("Ruby-Project/#{file}.json")
    File.read("Ruby-Project/#{file}.json")
  else
    empty_json = [].to_json
    File.write("Ruby-Project/#{file}.json", empty_json)
    empty_json
  end
end
