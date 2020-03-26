class FilmsController < ApplicationController
	def index
		@films = Film.all
		render json: @films 
	end

	def show 
		@film = Film.find(params[:id])
		render json: @film
	end

	def create
		@film = Film.new(film_params)
		if @film.save
			render json: { status: :ok, message: 'Create Success' }
		else
			render json: { json: @film.errors, status: :unprocessable_entity }
		end
	end

	def update
		@film = Film.find(params[:id])
		if @film.update(film_params)
			render json: { status: :ok, message: 'Update Success' }
		else
			render json: { json: @film.errors, status: :unprocessable_entity }
		end
	end

	private

	def film_params
		params.require(:film).permit(:title, :year, :intro)
	end
end
