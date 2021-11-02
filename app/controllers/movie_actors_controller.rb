class MovieActorsController < ApplicationController 
  def create
    MovieActor.create(movie_id: permit_params[:movie_id], actor_id: Actor.find_id_by_name(params[:query]))
    redirect_to "/movies/#{permit_params[:movie_id]}"
  end 

  private 
  def permit_params
    params.permit(:movie_id, :actor_id)
  end 
end 