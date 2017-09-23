class TextbooksController < ApplicationController
  
  def index
    @textbooks = Textbook.all
  end


end
