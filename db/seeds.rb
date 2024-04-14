
# The data can then be loaded with the bin/rails db:seed .
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Teacher.create(first_name: "John", last_name: "Doe")
Teacher.create(first_name: "Jane", last_name: "Doe")
Teacher.create(first_name: "Jack", last_name: "Doe")

teacher = Teacher.first # Assuming you have at least one teacher
subject = Subject.create(name: "Math")
TeachingAssignment.create(teacher: teacher, subject: subject)
