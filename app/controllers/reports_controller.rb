class ReportsController < ApplicationController
  def index
  end

  def courses_without_books
    @adoptions = Adoption.courses_without_books
  end
end
