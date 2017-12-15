class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  get "/figures/new" do
    erb :"/figures/new"
  end
  
  post "/figures" do
    @figure = Figure.create(params[:figure])
    new_title = params[:title][:name]
    if !new_title.empty?
       @figure.titles << Title.create(params[:title])
    end
    new_landmark = params[:landmark][:name]
    if !new_landmark.empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/edit"
  end
  
  patch '/figures/:id' do
    #
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    new_title = params[:title][:name]
    if !new_title.empty?
      @figure.titles << Title.create(params[:title])
    end
    new_landmark = params[:landmark][:name]
    if !new_landmark.empty?
       @figure.landmarks << Landmark.create(params[:landmark])
    end
    #binding.pry
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
end