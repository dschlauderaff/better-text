class TextbooksController < ApplicationController
  
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]

  def index
    if params[:course_id]
      @textbooks = Course.find(params[:course_id]).textbooks
    else
      @textbooks = Textbook.all
    end
  end

  def show
  end

  def new
    @textbook = Textbook.new
    if params[:course_id]
      @course = Course.find(params[:course_id])
    else
      @courses = Course.all
    end
  end

  def create
    # raise params.inspect
    @textbook = Textbook.create(textbook_params)
    return render :new  unless @textbook.save
    redirect_to textbook_path(@textbook)
  end

  def edit
    @courses = Course.all
  end

  def update
    @textbook.update(textbook_params)
    return render :edit unless @textbook.save
    redirect_to textbook_path(@textbook)
  end

  def destroy
    @textbook.destroy
    redirect_to textbooks_path
  end

  private

  def set_textbook
    @textbook = Textbook.find(params[:id])
  end

  def textbook_params
    params.require(:textbook).permit(:title, :price, :course_ids, course_ids:[], courses_attributes: [:name, :enrollment])
  end
end
