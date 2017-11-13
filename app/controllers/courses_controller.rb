class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @courses}
    end
  end

  def show
  end

  def new
    @course = Course.new
    @textbooks = Textbook.all
  end

  def create
    @course = Course.create(course_params)
    @textbooks = Textbook.all
    return render :new unless @course.save
    redirect_to course_path(@course)
  end

  def edit
    @textbooks = Textbook.all
  end

  def update
    @course.update(course_params)
    return render :edit unless @course.save
    redirect_to course_path(@course)
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :enrollment, textbook_ids:[], textbooks_attributes: [:title, :price])    
  end
end
