require_relative('../db/sql_runner.rb')

attr_reader :name, :logo, :id

class House

  def initialize(info)
    @id = info['id'].to_i() if ['id']
    @name = info['name']
    @logo = info('logo')
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


end
