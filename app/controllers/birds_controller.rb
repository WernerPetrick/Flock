class BirdsController < ApplicationController

  def index
    @birds = Bird.all
  end

  def show 
    @bird = Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
  end

  def create
    @bird = Bird.new(bird_params)

    if @bird.save
      redirect_to @bird
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    @bird = @bird = Bird.find(params[:id])

    if @bird.update(article_params)
      redirect_to @bird
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def next
    @bird = Bird.where("id > ?", params[:id]).first || Bird.first
    redirect_to bird_path(@bird)
  end

  def previous
    @bird = Bird.where("id < ?", params[:id]).last || Bird.last
    redirect_to bird_path(@bird)
  end

  private

  def bird_params
    params.require(:bird).permit(:title, :size, :habitat, :status, :image)
  end

end
