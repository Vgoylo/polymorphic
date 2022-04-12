class PicturesController < ApplicationController
  def index 
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end


  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)

    if @picture.save
      flash[:success] = 'Success'
      redirect_to picture_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
      if picture.destroy
        flahs[:success] = 'Success'
        redirect_to picture_path
      else
        flahs[:error] = 'Error'
      end
  end

  private

  def picture_params
    params.require(:picture).permit(:name)
  end
end
