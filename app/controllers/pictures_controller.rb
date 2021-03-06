class PicturesController < ApplicationController

  def index
    @most_recent_pictures = Picture.most_recent_five
    @one_month_pictures = Picture.created_before(1.day.ago)

    # @picture = Picture.all
    # Instead of showing all pictures, the most recent five photos will be shown on the homepage.
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
  end
end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end


private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end