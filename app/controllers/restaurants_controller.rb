class RestaurantsController < ApplicationController
   
  get '/' do 
    erb :'/restaurants/index'
  end

  get '/restaurants/:slug' do
    @restaurant = Restaurant.find_by_slug(params[:slug])
    
    erb :"restaurants/show"
  end

  # post '/restaurants' do 
  #   @restaurant = Restaurant.find_by_slug(params[name])


  #   redirect '/restaurants/#{@restaurant.slug}'
  # end


end