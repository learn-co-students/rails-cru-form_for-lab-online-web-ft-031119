class GenresController < ApplicationController
  def index
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def new
		@genre = Genre.new
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def create
		# refactored code: @post = Post.new(params["post"])
		# refacatored code: @post = Post.new(params.require(:post).permit(:title, :description))
		@genre = Genre.new(genre_params)
		@genre.save
 		redirect_to genre_path(@genre)
	end

	def update
	  @genre = Genre.find(params[:id])
	  # refactored code: @post.update(params["post"])
		# refactored code: @post.update(params.require(:post).permit(:title))
		@genre.update(genre_params)
	  redirect_to genre_path(@genre)
	end

	private

	#refactored code:  def post_params
	# 	params.require(:post).permit(:title, :description)
	# end

# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
		def genre_params
		  params.require(:genre).permit(:name)
		end
end
