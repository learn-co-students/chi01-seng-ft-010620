# Intro to ORMS

SWBATs (Students Will Be Able To)

- Define "ORM" and describe what they do
- Draw connections between tables / table rows / table fields and their equivalent concepts in the Ruby object space
- Define class methods to translate table data into Ruby instances
  Class.all => return all rows as instances
  Class#save => insert /update a record in the db
- Review Ruby inheritance as a method for sharing similar behavior between different classes
- Empathize with the reasoning behind the creation of tools like the ActiveRecord gem

Thinking like an ORM:
ALL THE TABLES WE HAVE  == Model Domain
ONE ENTIRE TABLE        == Ruby Class
ONE TABLE ROW           == Instance of Class
ONE FIELD (COLUMN NAME) == @instance_variable
