require_relative('../models/students')
require_relative('../models/houses')
require('pry')

Student.delete_all()
House.delete_all()

gryfinndor = House.new({
  'name' => 'Gryfinndor',
  'logo' => 'https://images-na.ssl-images-amazon.com/images/I/71y53v0TvzL._UX522_.jpg'
  })
gryfinndor.save()

hufflepuff = House.new({
  'name' => 'Hufflepuff',
  'logo' => 'https://images-na.ssl-images-amazon.com/images/I/71-suiUNk6L._UX522_.jpg'
  })
hufflepuff.save()

ravenclaw = House.new({
    'name' => 'Ravenclaw',
    'logo' => 'https://images-na.ssl-images-amazon.com/images/I/71sdJZ2JN9L._UX522_.jpg'
    })
ravenclaw.save()

slytherin = House.new({
  'name' => 'Slytherin',
  'logo' => 'https://images-na.ssl-images-amazon.com/images/I/71x0DA%2BfJRL._UX522_.jpg'
  })
slytherin.save()

student1 = Student.new(
  {
  'first_name' => 'Michael',
  'last_name' => 'Scott',
  'house_id' => hufflepuff.id,
  'age' => 35
  }
)
student1.save()

student2 = Student.new(
  {
  'first_name' => 'Jebediah',
  'last_name' => 'Kerman',
  'house_id' => gryfinndor.id,
  'age' => 14
  }
)
student2.save()

student3 = Student.new(
  {
    'first_name' => 'Malcolm',
    'last_name' => 'Tucker',
    'house_id' => slytherin.id,
    'age' => 45
  }
)
student3.save()

student4 = Student.new({
  'first_name' => 'The',
  'last_name' => 'Doctor',
  'house_id' => ravenclaw.id,
  'age' => 45
  })

student4.save()

binding.pry

nil
