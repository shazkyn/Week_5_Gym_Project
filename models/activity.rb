require_relative('../db/sql_runner')

class Activity

  attr_reader( :activity_name, :capacity, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @activity_name = options['activity_name']
    @capacity = options['capacity']
  end

  def save()
    sql = "INSERT INTO activities
    (
      activity_name,
      capacity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@activity_name, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# gets a list of members for an activity
  def members
    sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.activity_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM activities"
    results = SqlRunner.run( sql )
    return results.map { |hash| Activity.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM activities WHERE id = $2"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Activity.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM activities"
    SqlRunner.run( sql )
  end

  def update()
   sql = "UPDATE activities SET (activity_name, capacity) = ( $1, $2) WHERE id = $3"
   values = [@activity_name, @capacity, @id]
   SqlRunner.run( sql, values )
 end


 def self.destroy(id)
   sql = "DELETE FROM activities WHERE id = $1"
   values = [id]
   SqlRunner.run( sql, values )
 end

end
