require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/activity.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @booking = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do
  @activities = Activity.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do
  biting = Booking.new(params)
  biting.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end
