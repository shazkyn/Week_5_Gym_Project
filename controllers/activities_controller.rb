require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( '../models/activity.rb' )
also_reload( '../models/*' )

get '/activities' do
  @activities = Activity.all()
  erb ( :"activities/index" )
end

get '/activities/new' do
  @activities = Activity.all
  erb(:"activities/new")
end

get '/activities/:id' do
  @activity = Activity.find(params['id'].to_i)
  erb( :"activities/show" )
end

# create
post '/' do
  member = Activity.new(params)
  activity.save
  redirect to("/activities")
end

get '/activities/:id/edit' do
  @activity = Activity.find(params['id'].to_i)
  erb(:"activities/edit")
end

put '/activities/:id' do
  activity = Activity.new(params)
  # binding.pry
  activity.update
  redirect to '/activities'
end


get '/activities/:id/newbooking' do
  @activity = Activity.find(params['id'].to_i)
  erb(:"activities/book_member")
end

post '/activities' do
  activity = Activity.new(params)
  activity.save
  redirect to("/activities")
end


delete '/activities/:id/delete' do
  Activity.destroy(params[:id])
  redirect to("/activities")
end
