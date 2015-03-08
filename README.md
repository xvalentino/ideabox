# Project Option 1: IdeaBox

Let's create an app to record your ideas. 

## Categories

* ideas belong to a category
* categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create or destroy categories)
* users can create, edit/update, show, and destroy only their own ideas
* when a user types a new idea into the form, there is a [selection dropdown](http://guides.rubyonrails.org/form_helpers.html#option-tags-from-a-collection-of-arbitrary-objects) for choosing the correct category

## Images

* allow users to add images to their ideas
* an image can have many ideas and an idea can have many images
* images can only be created by an admin user

The most simplistic way to implement images is to store a url to an online image. If you're feeling fancy and want to upload your own images, check out [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) or [Paperclip](https://github.com/thoughtbot/paperclip). 

## Authentication and Authorization

* users need to log in to see their ideas
* users can only see their own ideas -- they should not be able to visit another user's page
* users cannot create ideas for other users
* users cannot create new categories -- only the admin can do that
* users cannot create images -- only the admin can do that; however, a user can assign an image to their idea


## How to Run the Ideabox Server

1. Once the repo is cloned, run 'rake db:migrate' in order to create the database

2. Then, run 'rails s' to start up the server
