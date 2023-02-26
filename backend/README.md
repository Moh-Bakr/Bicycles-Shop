### Setup instructions.:

* Ruby version ~> 3.2.1 (use rvm to install)
* Rails version ~> 7.0.4.2 (use rvm to install)
* System dependencies (SQLite3)
* Configuration 
run command `bundle install` to install all the dependencies
* Database creation run command `rails db:migrate` to migrate the database
* How to run the test suite run command `rspec` to run the test suite

#### About the Application

##### 🧪 Requirements

- A visitor to the site should be able to do the following:
    - See a list of all the available bicycles. Each listing should show a photo and
      the product's name, style, and price.
    - Click on any bicycle to view a page containing a larger photo and a description of
      the bicycle, in addition to its name, price, and style.
    - Use the search filter to search for a bike by name, style, or price (less than and/or greater than). Filters can be combined (i.e. visitors can filter bicycles using name and style).
- The shop owner should be able to do the following:
    - Log in to the administrative portal where the owner can add a new bicycle listing
      and modify or delete an existing bicycle listing. They should also be able to log out.
    - If the bicycle’s name contains the word `cat`, the price of the bike should be multiplied by the length of a cat fact fetched from [https://catfact.ninja/fact](https://catfact.ninja/fact), then divided by `5`
        - Example

          The shop owner adds a bike with the name `Cat Bike`, with a price of `12`, and clicks save. The length of the cat fact you fetched from the API is `77`. The saved price of the bike should be `12*77/5 -> 184.8`

        - If the API is not available or anything goes wrong, the length of the cat fact should default to `99`
        - This only applies to the create action and does not apply to the update action.

