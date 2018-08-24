require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb(:"members/edit")
end

get '/members/new' do
  @members = Member.all
  erb(:"bookings/new")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end

post '/members/:id/delete' do
  Member.destroy(params[:id])
  redirect to("/members")
end
