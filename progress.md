# Assignment: [PM Tool] AJAXify task creation & deletion Skip Next Module

1. ability to favorite projects. Users can't favorite their own projects.
   User can only favorite project ones. (*done*)
2. add a section for users to view their favorite projects.(*done*)
3. AJAXIFY task creation & deletion
    - Make creating tasks for projects use AJAX so that the page doesn't reload(*done*)
    - Make marking a task as complete use AJAX (*done*)
    - Make deleting a task use AJAX(*done*)
    - **Stretch, AJAXIFY task editing / Updating**

# Assignment: [PM Tool] AJAXify comment creation & deletion
1. Make creating comments for discussions use AJAX so that the page doesn't reload(*done*)
2. Make deleting a comment use AJAX(*done*)
3. **[Bonus] AJAXify comment editing / Updating**

# Assignment: [PM Tool] Add Emailing 2016-March-04
Add mailers to the following:

1. Discussion owner when someone comments on the discussion (if it's not the same user)(*done*)
2. Task owner when someone completes the task (if it's not the same user)


# Commit to Github

2016-March-03
1. discussion creation with using AJAX(*c*)
  - implemented discussion_create.js.erb && discussion_not_create.js.erb(*c*)
  - error message on top of the discussion_new_form(*c*)
2. created discussion show page(*c*)
  - added comment section, moved discussion to a separate action.(*c*)
3. deleting discussion using AJAX9(*c*)
4. Make creating comments for discussions use AJAX so that the page doesn't reload(*c*)
5. Displaying error messages on top of the comment-form(*c*)
6. Make deleting a comment use AJAX(*c*)

2016-March-04
1. implement mailers for comments(*done*)
  - need to implement not being able to to send email if it's the same user(*done*)
2. implement mailer for task(*done*)
