class TextbooksController < ApplicationController
  
  def index
    @textbooks = Textbook.all
  end

  def show
  end

  def new
    @textbook = Textbook.new
  end

  def create
    @textbook = Textbook.create(textbook_params)
    return render :new  unless @textbook.save
    redirect_to textbook_path(@textbook)
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


  def textbook_params
    params.require(:textbook).permit(:title, :price)
  end
end
