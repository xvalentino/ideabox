class IdeasController < ApplicationController

  def show
    # require 'pry'; binding.pry
    @idea = Idea.find(params[:id])
  end

end
