module AdoptionsHelper
  def adoption_for_course_and_textbook(course, textbook)
    Adoption.find_by_course_id_and_textbook_id(course.id, textbook.id)
  end
end
