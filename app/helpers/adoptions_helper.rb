module AdoptionsHelper
  def course_adoption(course, textbook)
    Adoption.find_by_course_id_and_textbook_id(course.id, textbook.id)
  end

  def view_history(course, textbook)
    adoption = course_adoption(course,textbook)
    if adoption.history == 0
      link_to "Add adoption history", edit_adoption_path(course_adoption(adoption))
    else
      "Historical Sell-through: #{adoption.history} units." 
    end
  end
end
