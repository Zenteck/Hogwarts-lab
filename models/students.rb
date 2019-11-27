require_relative('../db/sql_runner.rb')
require_relative('./houses.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(student)
    @id = student['id'].to_i() if student['id']
    @first_name = student['first_name']
    @last_name = student['last_name']
    @house_id = student['house_id'].to_i()
    @age = student['age'].to_i()
  end

  def save()
    sql = "INSERT INTO students
    (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    return Student.new(student)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    houses = SqlRunner.run(sql, values)
    return houses.map{|house| House.new(house)}
  end

end
