require_relative('../models/students')
require('pry')

Student.delete_all()

student1 = Student.new(
  {
  'first_name' => 'Michael',
  'last_name' => 'Scott',
  'house' => 'Hufflepuff',
  'age' => 35
  }
)
student1.save()

student2 = Student.new(
  {
  'first_name' => 'Jebediah',
  'last_name' => 'Kerman',
  'house' => 'Griffindor',
  'age' => 14
  }
)
student2.save()


binding.pry

nil
