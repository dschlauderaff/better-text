$(function() {
  $('a:contains("View textbooks")').on('click', function(){
    $.getJSON('/textbooks').done(function(data){
      console.log(data)
    })


    event.preventDefault()
  })
})