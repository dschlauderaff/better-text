# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  bettertext.js 124: ajax request to render show data for textbook
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  bettertext.js 98 + 111: ajax request to render @textbooks and @courses collection
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  bettertext.js 124: json response for a textbook that has_many courses will have all of those courses displayed in the show view
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  bettertext.js 62: hijacks form submission and renders the response without refreshing the page
- [x] Translate JSON responses into js model objects.
  bettertext.js 62 + 124: responses to ajax requests are used to build the Texbook, Course, and Adoption js models
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  all js models use handlebars templates added to the model prototype to render the html to be appended to the DOM
    

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message