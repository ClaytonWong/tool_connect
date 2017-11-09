Project summery

Problem definition:
Not everybody can afford to buy any tool they want to work on their home project or fix something at their home. Also, some people wish to save money by not buying tools that they only use occasionally. Furthermore, there are people out there who have space constraints at their home, and therefore cannot keep a lot of tools, especially large ones at their home.

Solution:
My 2 sided market place application connects those without the right tools with the ones who do, thereby giving the ‘have nots’ access to the tools they need.

More about the solution:
Users need an account if they want to hire tools or rent theirs out. After creating an account, they also need to create a profile by giving their name and some contact details so that they can be traced. This is because there is exchange of money involved and some tools can be used as weapons.

The user stories and rough to do lists can be found on this Trello link:
https://trello.com/b/EfVAnbVs/2-sided-tool-rental-market
file:///media/n/Data/WebDev/coder-academy-rails/apps/project/Screenshot%20from%20Trello.png

The ERD for the database can be found here:
http://dbdesigner.net/designer/schema/122293
file:///media/n/Data/WebDev/coder-academy-rails/apps/project/erd.png

Here are the Figma links to my wire frames:
Low fidelity version:
https://www.figma.com/file/XwrJMWEdueGUQoawcv7JIMxa/2-sided-tool-rental-marketplace-(low-fidelity)
file:///media/n/Data/WebDev/coder-academy-rails/apps/project/2%20sided%20tool%20rental%20marketplace%20(low%20fidelity).png

High fidelity version:
https://www.figma.com/file/HInK4G8AkmwCCfuIZM04fupP/2-sided-tool-rental-market-place-(high-fidelity)
file:///media/n/Data/WebDev/coder-academy-rails/apps/project/2%20sided%20tool%20rental%20market%20place%20(high%20fidelity).png

Problems and challenges encounted that I overcame:

1) Redirecting user to profile creation page after signing up.
Brief description of solution:
Added the following code to the routes file:

devise_for :users, controllers: { registrations: "users/registrations" }

, generate a registrations controller, uncomment the method after_sign_up_path_for(resource) , then  put in the code new_profile_path

2) Integrating Shrine gem into application.
Brief description of Solution:
Had to rename some attributes.

3) Had a minor problem adapting messaging code from a previously solved challenges into the
     application.
Brief description of Solution:
Rename some of the variables used.

4) Adapting code for Stripe from previous code along into this project.
Brief description of Solution:
Rename some of the variables used and fixing syntax errors.

5) Showing existing rentals and new rental form on the same page.
Brief description of Solution:
Copy some of the code from the rental controller’s index action and index page into the new page,

6) Displaying a calendar.
Brief description of Solution:
Adapted the code from the following tutorial:

https://richonrails.com/articles/building-a-basic-calendar-in-ruby-on-rails

Then putting some of the code from it into the new rentals page.

7) Populating calendar with correct number of rentals.
Brief description of Solution:
First I had to think about the logic for populating the calendar with rentals. When drawing a cell for a day in the calendar, I needed to check if that day is the start, middle, or end of a rental. If one of those 3 conditions is true, then populate that day with a rental.
I had a lot of trouble inserting the start of a rental. To solve this problem, I had to use byebug to go to the part where it was not inserting the rental, then check the logic for the if statement, eventually, I traced the problem to the comparison between the date on the calendar and startdate and time for a rental, this comparison was evaluating not equal. Which prevented the problem. To fix this, I had to strip the time away from the start of the rental so that you are just comparing 2 dates, which will allow the comparison to evaluate to equal and let the rental to be inserted into the calandar.