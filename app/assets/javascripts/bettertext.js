$(function() {
  $('div.d-container').on('click', 'a.textbooks', function (event) {
    // debugger
    event.preventDefault()
    $.getJSON(this.href).success(function(data){
      let $div = $('div#textbooks')
      $div.empty()

      data.forEach(textbook => {
        $div.append(`<h3><a href='/textbooks/${textbook.id}'>${textbook.title}</a></h3>`)
      });
    })


  })
})