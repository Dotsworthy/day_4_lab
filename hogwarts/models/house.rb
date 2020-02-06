require_relative('../db/sql_runner')

class House

  attr_reader :id, :name


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(
    name
    ) values($1)
    RETURNING id"
    values = [@name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end
  # 
  # def self.find_id_by_name(name)
  #   sql = "SELECT * FROM houses WHERE name = $1"
  #   values = [name]
  #   house_data = SqlRunner.run(sql, values)
  #   # return house_data
  #   result = house_data.map{|id| House.new(id)}[0]
  #   return result
  # end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map{|house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    houses = SqlRunner.run(sql, values)
    house = House.new(houses.first)
    return house
  end


end
