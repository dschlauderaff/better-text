$(function() {
  $('a.textbooks').on('click', function(){
    $.getJSON(this.href).success(function(data){
      let $div = $('div#textbooks')
      $div.empty()

      data.forEach(textbook => {
        // debugger
        $div.append(`<h3><a href='/textbooks/${textbook.id}'>${textbook.title}</a></h3>`)
      });
    })


    event.preventDefault()
  })
})