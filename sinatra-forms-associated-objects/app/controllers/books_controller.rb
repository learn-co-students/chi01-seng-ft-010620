class BooksController < ApplicationController
  # Index
  get '/books' do
    @books = Book.includes(:author).all

    erb :'books/index'
  end

  # New
  get '/books/new' do
    # TODO: Finish form for a Book that belongs to an Author
    @authors = Author.all
    erb :'books/new'
  end

  # Create
  post '/books' do
    p params
    Book.create(params[:book])
    redirect '/books'
  end

  # Show
  get '/books/:id' do
    @book = Book.includes(:author).find(params[:id])

    erb :'books/show'
  end


  # Edit
  get '/books/:id/edit' do
    erb :'books/edit'
  end

  # Update
  # TODO: handle update

  # Delete
  delete '/books/:id' do
    Book.destroy(params[:id])

    redirect '/books'
  end
end
