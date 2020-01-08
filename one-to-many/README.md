# One to Many Relationships

## Objectives

* Implement one object to many objects relationship
  * One object has many objects
  * One object belongs to another object
* Practice passing custom objects as arguments to methods
* Demonstrate single source of truth
* Infer type of method (class or instance) through naming conventions

## Deliverables

* Create a User class. The class should have these methods:
  * 🤫`#initialize` which takes a username and have
  * 🤗a reader method for the username
  * 😎`#tweets` that returns an array of Tweet instances
  * `#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection
* Create a Tweet class. The class should have these methods:
  * 🤩`Tweet#message` that returns a string
  * 🥳`Tweet#user` that returns an instance of the user class
  * `Tweet.all` that returns all the Tweets created.
  * 😗`Tweet#username` that returns the username of the tweet's user
