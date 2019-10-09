class ApplicationController < Sinatra::Base
  set :method_override, true
  set :views, 'app/views/'
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
  
end
