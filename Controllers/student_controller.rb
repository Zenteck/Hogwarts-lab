require_relative('../models/students')

#index

get '/students' do
  @students = Student.all()
  erb(:"students/index")
end
