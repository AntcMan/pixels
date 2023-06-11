class ImagesController < ApplicationController

  # INDEX ALL IMAGES/HOMEPAGE
  def index
    @images = Image.all
  end

  # CREATE NEW INSTANCE OF IMAGE
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    @image.date_uploaded = params[:image][:date_uploaded].to_date
    if @image.save
      redirect_to images_path, notice: 'Image successfully uploaded'
    else
      # RENDER NEW IMAGE UPLOAD IF UNSUCCESSFUL
      render :new
    end
  end

  # SHOW IMAGE
  def show
    @image = Image.find(params[:id])
  end

  # DELETE IMAGE
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path, notice: 'Image deleted'
  end

  private

  def image_params
    params.require(:image).permit(:title, :date_uploaded, :image)
  end
end
