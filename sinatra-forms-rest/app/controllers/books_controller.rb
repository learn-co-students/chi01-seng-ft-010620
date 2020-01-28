class BooksController < ApplicationController
  # Index
  get '/books' do
    @books = Book.all
    erb :'books/index'
  end

  # New
  get '/books/new' do
    erb :'books/new'
  end

  # Create
  post '/books' do
    p params
    p nonexistent_var
    # book = Book.create({title: params[:title], author: params[:author], snippet: params[:snippet]})
    book = Book.create(params[:book])
    redirect "/books/#{book.id}"
  end

  # Show
  get '/books/:id' do
    p params
    @book = find_book
    erb :'books/show'
  end

  # Edit
  get '/books/:id/edit' do
    @book = find_book
    erb :'books/edit'
  end

  # Put
  put '/books/:id' do
    p params
    book = find_book
    p "******************************"
    book.update(params[:book])
    redirect "/books/#{book.id}"
  end

  # Delete
  delete '/books/:id' do
    book = find_book
    book.destroy
    redirect "/books"
  end

  def find_book
    Book.find(params[:id])
  end
end
