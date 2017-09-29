class HomesController < ApplicationController
  def index
  end

  def read_more
    @document = params[:document]
  end
end
