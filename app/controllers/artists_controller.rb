class ArtistsController < ApplicationController
  def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def create
		# refactored code: @post = Post.new(params["post"])
		# refacatored code: @post = Post.new(params.require(:post).permit(:title, :description))
		@artist = Artist.new(artist_params)
		@artist.save
 		redirect_to artist_path(@artist)
	end

	def update
	  @artist = Artist.find(params[:id])
	  # refactored code: @post.update(params["post"])
		# refactored code: @post.update(params.require(:post).permit(:title))
		@artist.update(artist_params)
	  redirect_to artist_path(@artist)
	end

	private

	#refactored code:  def post_params
	# 	params.require(:post).permit(:title, :description)
	# end

# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
		def artist_params
		  params.require(:artist).permit(:name, :bio)
		end


end
