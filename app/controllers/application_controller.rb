class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :document_list, only: [:index]

  private

  def document_list
    # @galleries = Gallery.all
    # @documents = @galleries.map { |gallery| gallery.documents.paginate(page: params[:page], per_page: 10) }.flatten
    @documents = Document.paginate(page: params[:page], per_page: 10).reverse
  end
end