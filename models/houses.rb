require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo


  def initialize(info)
    @id = info['id'].to_i() if ['id']
    @name = info['name']
    @logo = info['logo']
  end

  def save()
    sql = "INSERT INTO houses
    (name, logo)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map{|house| House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

end
