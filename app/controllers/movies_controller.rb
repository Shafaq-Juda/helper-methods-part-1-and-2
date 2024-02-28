class MoviesController < ApplicationController
  def new
    @the_movie = Movie.new

    # render template: "movies/new" #we don't need it as rails smartly understand that we want to go to that relevant template when the template folders name is same as the class controller name and template itself name is same as the action name.
  end

  def index
    matching_movies = Movie.all

    @list_of_movies = matching_movies.order(created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html #do
        # render({ :template => "movies/index" })
     # end
    end
  end

  def show
    #the_id = params.fetch(:id)
    #matching_movies = Movie.where(id: the_id)
    #@the_movie = matching_movies.first

    # instead of the above 3 lines, from now we will usethe following:

    @the_movie = Movie.find(params.fetch(:id))
    #render({ :template => "movies/show" })
  end

  def create
    @the_movie = Movie.new
    @the_movie.title = params.fetch("query_title")
    @the_movie.description = params.fetch("query_description")

    if @the_movie.valid?
      @the_movie.save
      redirect_to(movies_url, { notice: "Movie created successfully." })
    else
      render template: "movies/new"
    end
  end

  def edit
    # the_id = params.fetch(:id)

    # matching_movies = Movie.where({ :id => the_id })

    # @the_movie = matching_movies.first

    @the_movie = Movie.find(params.fetch(:id))

   # render({ :template => "movies/edit" })
   # dont need this any more bcaz we have the same name of controller and template folder and same name of template and the action.
  end

  def update
    # the_id = params.fetch(:id)
    # the_movie = Movie.where({ :id => the_id }).first
    the_movie = Movie.find(params.fetch(:id))
    the_movie.title = params.fetch("query_title")
    the_movie.description = params.fetch("query_description")

    if the_movie.valid?
      the_movie.save
      redirect_to(movie_url(the_movie.id), { notice: "Movie updated successfully."} )
    else
      redirect_to(movie_url(the_movie.id), { alert: "Movie failed to update successfully." })
    end
  end

  def destroy
    # the_id = params.fetch(:id)
    # the_movie = Movie.where({ :id => the_id }).first
    the_movie = Movie.find(params.fetch(:id))
    the_movie.destroy

    redirect_to(movies_url, { notice: "Movie deleted successfully."} )
  end
end
