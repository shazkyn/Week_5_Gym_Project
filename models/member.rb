require_relative( '../db/sql_runner' )

class Member

  attr_reader( :name, :age, :email, :phone, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @email = options['email']
    @phone = options['phone']
  end

  def save()
    sql = "INSERT INTO members
    (
      name,
      age,
      email,
      phone
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @age, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |hash| Member.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def update()
   sql = "UPDATE members
   SET
   (
     name,
     age,
     email,
     phone
   ) =
   (
     $1, $2, $3, $4
   )
   WHERE id = $4"
   values = [@name, @age, @email, @phone, @id]
   SqlRunner.run( sql, values )
 end

 def self.destroy(id)
   sql = "DELETE FROM members WHERE id = $1"
   values = [id]
   SqlRunner.run( sql, values )
 end

end
