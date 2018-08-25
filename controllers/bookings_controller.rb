require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/activity.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

# get '/bookings' do
#   @booking = Booking.all
#   erb ( :"bookings/index" )
# end
#
# get '/bookings/new' do
#   @activities = Activity.all
#   @members = Member.all
#   erb(:"bookings/new")
# end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/activities/" + params[:activity_id])
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/activities/" + params[:activity_id])
end
