require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/activity.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

# get '/bookings' do
#   @activity = Activity.find(params[:id])
#   @members = @activity.members()
#   erb(:"bookings/show")
# end

get '/bookings' do
  @bookings = Booking.all
  @activities = Activity.id
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  # redirect to("/activities/" + params['activity_id'])
  redirect to ("/bookings")
end

get '/activities/:id/bookings' do
  @activity = Activity.find(params[:id])
  @members = @activity.members()
  erb ( :"activity/bookings")
end

get'/bookings/new' do
  @booking = Booking.all
  @activities = Activity.all
  @members = Member.all
  erb(:"bookings/new")
end

delete '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings" )
end

get '/activities/:id/book_class' do
  @members = Member.all
  @activity_name = params[:id]
  erb(:"booking/new")
end

post '/activities/:activity_id/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to "/activities/#{params['activity_name']}/bookings"
end

get '/members/:id/bookings' do
  @members = Member.find(params[:id])
  @activities = @members.booked_classes()
  erb ( :"member/bookings")
end

# post '/members/:member_id/bookings' do
#   booking = Booking.new(params)
#   booking.save
#   redirect to "/members/#{params['name']}/bookings"
# end
