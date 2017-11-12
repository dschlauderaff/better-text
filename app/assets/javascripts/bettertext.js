$(function() {
  $('a:contains("View textbooks")').on('click', function(){
    $.ajax({
      url: this.href,
      dataType: 'script'
    })


    event.preventDefault()
  })
})