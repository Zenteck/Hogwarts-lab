require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(student)
    @id = student['id'].to_i() if student['id']
    @first_name = student['first_name']
    @last_name = student['last_name']
    @house = student['house']
    @age = student['age'].to_i()
  end

  def save()
    sql = "INSERT INTO students
    (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


end
