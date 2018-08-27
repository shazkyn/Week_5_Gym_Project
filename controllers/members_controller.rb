require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
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
post '/new_member' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end

# edit
get '/members/edit' do
    @member = Member.find()
    erb(:"members/edit")
end


post '/members/id/redirect' do
  member = Member.new(params)
  member.save
  redirect to("/members/member.id")
end

# update
put '/members/:id' do
  binding.pry
  member = Member.new(params)
  member.update
  redirect to '/members'
end

# delete
delete '/members/:id' do
  Member.destroy(params[:id])
  redirect to("/members")
end


post '/members/:id' do
  member.save
  redirect to("/members/:id")
end
