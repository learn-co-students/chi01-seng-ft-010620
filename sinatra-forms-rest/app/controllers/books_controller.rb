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

  # Show
  get '/books/:id' do
    p params
    @book = Book.find(params[:id])
    erb :'books/show'
  end

  # Create
  post '/books' do
    p params
    # book = Book.create({title: params[:title], author: params[:author], snippet: params[:snippet]})
    book = Book.create(params[:book])
    redirect "/books/#{book.id}"
  end

end
