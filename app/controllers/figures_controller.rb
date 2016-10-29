class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @figures
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @figure.save 
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @figure.titles << Title.find_or_create_by(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.title_ids = params[:figure][:title_ids]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end








