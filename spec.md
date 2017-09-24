# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Textbooks has_many adoptions) 
- [x] Include at least one belongs_to relationship (adoptions belongs_to textbook)
- [x] Include at least one has_many through relationship (textbooks has_many courses through adoptions)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (adoption.ordered)
- [x] Include reasonable validations for simple model objects (Textbooks, Courses, validate presence of unique title/name, numericality of price/enrollment)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name textbooks/new, course)
- [x] Include signup (using Devise)
- [x] Include login (using Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (Devise/OmniAuth - Facebook)
- [x] Include nested resource show or index (URL e.g. courses/1/textbook/3)
- [x] Include nested resource "new" form (URL e.g. courses/1/textbooks/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate