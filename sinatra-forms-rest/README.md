RESTful routing!

Objectives

Understand what REST is
Implement REST conventions when naming routes and resources (and also organizing them)
Get more practice working with user input via the `params` hash
**Work with params from multiple sources at once!**

Q&A
Table fighting over post vs get

get '/kittens' do
  # kitten index
end

post '/kittens' do
  # kitten creation
end

VERB          WHAT IT DOES
get
post
put/patch
delete
