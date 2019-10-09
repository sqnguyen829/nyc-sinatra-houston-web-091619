class FiguresController < ApplicationController
  # add controller methods
  set :method_override, true
  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  post '/figures' do
    figure = Figure.create(params)
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(name: params[:name])
    redirect "/figures/#{figure.id}"
  end

  delete '/figures/:id' do 
    figure = Figure.find(params[:id])
    figure.destroy 
    redirect '/figures'
  end


end
