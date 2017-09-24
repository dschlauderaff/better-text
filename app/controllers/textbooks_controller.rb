class TextbooksController < ApplicationController
  
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]

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
    @textbook.update(textbook_params)
    return render :edit unless @textbook.save
    redirect_to textbook_path(@textbook)
  end

  def destroy
    @textbook.destroy
  end

  private

  def set_textbook
    @textbook = Textbook.find_by(params[:id])
  end

  def textbook_params
    params.require(:textbook).permit(:title, :price, course_ids:[], courses_attributes: [:name, :enrollment])
  end
end
