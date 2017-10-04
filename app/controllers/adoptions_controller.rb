class AdoptionsController < ApplicationController

  before_action :set_adoption, only: [:edit, :update]

  def edit
    
  end

  def update
    @course.update(course_params)
    return render :edit unless @course.save
    redirect_to course_path(@course)
  end
 
  def order_textbook
    @adoption = Adoption.find(params[:adoption_id])
    @adoption.order_to_enrollment
    redirect_to textbook_path(@adoption.textbook)
  end


  private

  def set_adoption
    @adoption = Adoption.find(params[:id])
  end
end
