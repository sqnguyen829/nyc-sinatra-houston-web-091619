class LandmarksController < ApplicationController
  # add controller methods
  set :method_override, true
  get '/landmarks' do 
    @landmarks = Landmark.all 
    #@figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end
  
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
  post '/landmarks' do
    landmark = Landmark.create(params)
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(name: params[:name], figure_id: params[:figure_id], year_completed: params[:year_completed])
    redirect "/landmarks/#{landmark.id}"
  end

  delete '/landmarks/:id' do 
    landmark = Landmark.find(params[:id])
    landmark.destroy 
    redirect '/landmarks'
  end
end
