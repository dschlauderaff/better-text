class TextbooksController < ApplicationController
  
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]

  def index
    if params[:course_id]
      @textbooks = Course.find(params[:course_id]).textbooks
    else
      @textbooks = Textbook.all
    end

    respond_to do |format|
      format.html { render :index}
      format.json { render json: @textbooks}
      end
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
    @textbook = Textbook.create(textbook_params)
    @courses = Course.all
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
    @textbook.adoptions.delete_all
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
