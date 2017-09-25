class AdoptionsController < ApplicationController

  def order_textbook
    @adoption = Adoption.find(params[:adoption_id])
    @adoption.order_to_enrollment
    redirect_to textbook_path(@adoption.textbook)
  end

end
