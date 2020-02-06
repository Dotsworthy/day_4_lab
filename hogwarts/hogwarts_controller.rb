require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")


get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/houses' do
  @houses = House.all()
  erb(:house_index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:student)
end

get '/houses/:id' do
  @house = House.find(params[:id])
  erb(:house)
end
