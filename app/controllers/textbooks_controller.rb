class TextbooksController < ApplicationController
  
  def index
    @textbooks = Textbook.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    textbook.destroy
  end

  private

  def textbook
    @textbook ||= Textbook.find(params[:id])
  end
  helper_method :textbook

  def new_textbook 
    @new_textbook ||= Textbook.new(params[:textbook])
  end
  helper_method :new_textbook
end
