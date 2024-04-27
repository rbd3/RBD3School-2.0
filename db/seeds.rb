
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
subject = Subject.create(Title: "Math")
TeachingAssignment.create(teacher: teacher, subject: subject)

Student.create(first_name: "bolida", last_name:"Dede", email:"dede@gmail.com")
student = Student.create(first_name: "Mike", last_name: "Travice"
, email: "john@example.com")

student = Student.create(first_name: "bolida", last_name: "Dede", email: "dede@gmail.com")

# Associate subjects with the student
subject1 = Subject.create(title: "Physic")
subject2 = Subject.create(title: "Science")

student.subjects << subject1
student.subjects << subject2

# Save changes to the database
student.save

# Now when you query the student's subjects, you should see the associated subjects
student.subjects

