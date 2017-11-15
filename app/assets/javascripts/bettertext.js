function Textbook(attributes){
  this.title = attributes.title
  this.id = attributes.id
  this.price = attributes.price
  this.inventory = attributes.inventory
  this.courses = attributes.courses
  this.adoptions = attributes.adoptions
}

Textbook.prototype.renderShow = function (){
  return Textbook.template(this)
}

function Course(attributes){
  this.name = attributes.name
  this.id = attributes.id
  this.enrollment = attributes.enrollment
}

Course.prototype.renderShow = function (){
  return Course.template(this)
}

function Adoption(attributes){
  this.id = attributes.id
  this.course_id = attributes.course_id
  this.textbook_id = attributes.textbook_id
  this.ordered = attributes.ordered
}

Adoption.prototype.renderButton = function (){
  return Adoption.template(this)
}

function createCoursePartial(element){
  let course = new Course(element)
  let courseShow = course.renderShow()

  $('ul#textbook-courses').append(courseShow)
}

function createAdoptionButton(element){
  let adoption = new Adoption(element)
  let adoptionButton = adoption.renderButton()

  $(`#course_id_${adoption.course_id}`).after(adoptionButton)

}

$(function() {

  //New Textbook Form ajax call
  $("form#new_textbook").on('submit', function(e){
    e.preventDefault()

    let $form = $(this)
    let action = $form.attr('action')
    let params = $form.serialize()
    $.ajax({
      url: action,
      data: params,
      dataType: 'JSON',
      method: 'POST',
      success: function (json) {
        let $div = $('div#main')
        let textbook = new Textbook(json)
        let textbookShow = textbook.renderShow()
        
        $div.empty()
        $div.append(textbookShow)
        textbook.courses.forEach(element => {
          createCoursePartial(element)
        })

        textbook.adoptions.forEach(element => {
          createAdoptionButton(element)
        })
      },
      error: function (xhr) {
        let errors = $.parseJSON(xhr.responseText).errors
        alert(errors.join(', '))
        $('#new_textbook input:submit').prop('disabled', false)
      }
    }) 
  })

  //Welcome Page Textbook Index ajax call
  $('div#main').on('click', 'a.textbooks', function (event) {
    event.preventDefault()
    $.getJSON(this.href).success(function(data){
      let $div = $('div#textbooks')
      $div.empty()

      data.forEach(textbook => {
        $div.append(`<h3><a href='/textbooks/${textbook.id}'>${textbook.title}</a></h3>`)
      })
    })
  })

  //Welcome Page Course Index ajax call
  $('div#main').on('click', 'a.courses', function (event) {
    event.preventDefault()
    $.getJSON(this.href).success(function(data){
      let $div = $('div#courses')
      $div.empty()

      data.forEach(course => {
        $div.append(`<h3><a href='/courses/${course.id}'>${course.name}</a></h3>`)
      })
    })
  })

  //templates for creating new textbook with ajax request  
  if ($('#textbook-template').length > 0) {
    Textbook.templateSource = $('#textbook-template').html()
    Textbook.template = Handlebars.compile(Textbook.templateSource)
    Course.templateSource = $('#textbook-course-template').html()
    Course.template = Handlebars.compile(Course.templateSource)
    Adoption.templateSource = $('#order-template').html()
    Adoption.template = Handlebars.compile(Adoption.templateSource)
  }
})