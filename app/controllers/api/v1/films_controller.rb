class Api::V1::FilmsController < ApiController
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
			render json: { result: {id: params[:id]}, status: :ok, message: 'Update Success' }
		else
			render json: { json: @film.errors, status: :unprocessable_entity }
		end
	end

	def destroy
		@film = Film.find(params[:id])
		if @film.destroy
			render json: { json: 'The film was successfully deleted.'}
		else
			render json: { json: @film.errors, status: :unprocessable_entity }
		end
	end

	private

	def film_params
		#api params no require()
		params.permit(:title, :year, :intro)
	end
end
