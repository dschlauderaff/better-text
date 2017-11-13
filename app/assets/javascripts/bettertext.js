$(function() {
  $('div.d-container').on('click', 'a.textbooks', function (event) {
    event.preventDefault()
    $.getJSON(this.href).success(function(data){
      let $div = $('div#textbooks')
      $div.empty()

      data.forEach(textbook => {
        $div.append(`<h3><a href='/textbooks/${textbook.id}'>${textbook.title}</a></h3>`)
      });
    })
  })
  $('div.d-container').on('click', 'a.courses', function (event) {
    event.preventDefault()
    $.getJSON(this.href).successs(function(data){
      let $div = $('div#courses')
      $div.empty()

      
    })
  })
})