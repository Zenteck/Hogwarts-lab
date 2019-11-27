require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./controllers/student_controller')
# require_relative('./controllers/houses_controller')
also_reload('./models/*')

#index route
get '/' do
  erb(:home)
end
