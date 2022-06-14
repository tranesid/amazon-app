class Api::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  def index
    render json: Author.all
  end
 
  def show
    render json: @author
  end

  def create
    #create in memory
    @author = Author.new(author_params)
    #try to save a db
    if(@author.save)
    else
      render json: @author.errors.full_message, status: 422
    end
  end

  def update
    #get the author from db, in our before actions we set it
    if(Author.update(author_params))
      render json: @author 
    else 
      render json: @author.errors.full_message, status: 422
  end 

  def destroy
    #destroy removes from db and returns the thing that was destroyed
    render json: @author.destroy
  end



  private
  
  def set_author 
    @author = Author.find(params[:id])
  end

  def author_params
    params.require[:author].permit(:name, :age)
  end
end
