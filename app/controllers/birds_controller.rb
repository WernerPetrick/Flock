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
    @bird = Bird.find(params[:id])
  
    if @bird.update(bird_params)
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

  def mark_seen_birds
  current_user.seen_birds << Bird.where(id: params[:bird_ids])
  current_user.seen_birds = current_user.seen_birds.uniq 
  current_user.save

  redirect_to birds_path, notice: "Bird sightings updated!"
  end
  
  def remove_seen_bird
    @bird = Bird.find(params[:id])
    current_user.seen_birds.delete(@bird)
    current_user.save
  
    redirect_to birds_path, notice: "Bird removed from your seen list."
  end

  private

  def bird_params
    params.require(:bird).permit(:name, :breeding_season, :size, :habitat, :status, :description, :image)
  end

end
