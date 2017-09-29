class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
    @documents = @galleries.map { |gallery| gallery.documents }.flatten
    # @documents = @documents.paginate(page: params[:page], per_page: 10)
  end

  def new
    @gallery = Gallery.new
    @gallery.documents.build
  end

  def edit
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(gallery_params)
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to galleries_path, notice: t("photo_uploaded_successfully") }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "The photo is deleted successfully"
    redirect_to galleries_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :notes, documents_attributes: [:image])
  end
end
