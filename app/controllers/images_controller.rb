class ImagesController < ApplicationController
  # INDEX ALL IMAGES/HOMEPAGE
  def index
    @images = Image.all
    @images = Image.order(created_at: params[:sort] || :desc)
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

  # EDIT IMAGE
  def edit
    @image = Image.find(params[:id])
  end

  # UPDATE IMAGE
  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:success] = "Image title updated!"
      redirect_to images_path
    else
      render :edit, status: :unprocessable_entity
      flash[:error] = "Image title was not updated!"
    end
  end

  # IMAGES INDEX
  def index_list
    @images = Image.all
  end

  # SHOW IMAGE
  def show
    @image = Image.find(params[:id])
  end

  # DELETE IMAGE
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :date_uploaded, :image)
  end
end
