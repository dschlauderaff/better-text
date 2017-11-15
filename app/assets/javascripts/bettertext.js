function Textbook(attributes){
  this.title = attributes.title
  this.id = attributes.id
  this.price = attributes.price
  this.inventory = attributes.inventory
}
$(function(){
  Textbook.templateSource = $('#textbook-template').html()
  Textbook.template = Handlebars.compile(Textbook.templateSource)
})


Textbook.prototype.renderShow = function (){
  return Textbook.template(this)
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

        console.log("it works", json)
      },
      error: function (xhr) {
        console.log("Problem?", xhr)
        let errors = $.parseJSON(xhr.responseText).errors
        alert(errors.join(', '))
      }
    }) 
    // .success(function(json){
    //   let $div = $('div#main')
    //   let textbook = new Textbook(json)
    //   let textbookShow = textbook.renderShow()

    //   $div.empty()
    //   $div.append(textbookShow)

    //   console.log("it works", json)
    // })
    // .error(function(response){
    //   console.log("Problem?", response)
    //   let errors = $.parseJSON(response.responseText).errors
    //   debugger
    // })
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
})