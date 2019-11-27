require_relative('../models/students')

#index

get '/students' do
  @students = Student.all()
  erb(:"students/index")
end

#NEW
get '/students/new' do
  @houses = ["Griffindor", "Slytherin", "Hufflepuff", "Ravenclaw"]
  erb(:"students/new")
end

#CREATE
post '/students' do
  student = Student.new(params)
  student.save()
  redirect "/students"
end
