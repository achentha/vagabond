class CitiesController < ApplicationController
	def show
		@city = City.find_by(name: params[:cityname])
		@posts = @city.posts.page(params[:page]).per(10)
	end
end
