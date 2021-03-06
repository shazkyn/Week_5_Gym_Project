require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
require('pry-byebug')
also_reload( '../models/*' )

# index
get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

# new
get '/members/new' do
  @members = Member.all
  erb(:"members/new")
end

# create
post '/' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end

# edit
get '/members/edit' do
  @member = Member.find()
  erb(:"members/edit")
end

get '/members/:id' do
  @member = Member.find_by_id(params['id'].to_i)
  erb( :"members/show" )
end


# update
put '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to '/members'
end

delete '/members/:id/delete' do #delete action
  @member = Member.find_by_id(params[:id])
  @member.destroy
  redirect to '/members'
end
