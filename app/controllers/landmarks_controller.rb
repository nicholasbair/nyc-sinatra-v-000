class LandmarksController < ApplicationController
  # get all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  # get the new form
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  # post the new form
  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect :"/landmarks/#{@landmark.id}"
  end

  # get a single landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # get the edit form
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  # post the edit form
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect :"/landmarks/#{@landmark.id}"
  end
end
