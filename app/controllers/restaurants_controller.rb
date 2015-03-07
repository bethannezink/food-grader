class RestaurantsController < ApplicationController
   
  get '/' do 

    erb :'/restaurants/index'
  end

  get '/restaurants/:slug' do
    @restaurant = Restaurant.find_by_slug(params[:slug])
   
    erb :'restaurants/show'
  end

  get '/search' do 
    @restaurant = Restaurant.where(:name => params[:query].upcase)
    if params[:query] == "" || params[:query] == nil
      erb :"/restaurants/index", locals: { message: "Oops! Search field was empty. Please try again."}
    elsif @restaurant.empty?
      erb :"/restaurants/index", locals: { message: "Oops! Restaurant name not found. Please try again."}
    elsif @restaurant.count == 1
      redirect "/restaurants/#{@restaurant.first.slug}"
    elsif @restaurant.count > 1
      erb :'restaurants/results' 
    end
  end

end

