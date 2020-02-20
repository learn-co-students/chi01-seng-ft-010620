function main(){
  document.addEventListener('DOMContentLoaded', function(){
    fetchBooks()
    createFormListener()
  })
}


function createFormListener(){
  const form = document.querySelector('form')
  form.addEventListener('submit', function(e){
    e.preventDefault()
    const formData = {
      title: e.target[0].value,
      author: e.target[1].value
    }

    e.target.reset()


    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    }



    fetch('http://localhost:3000/books', reqObj)
      .then(resp => resp.json())
      .then(book => {
        renderBook(book)
      })


  })
}






function fetchBooks(){
  fetch('http://localhost:3000/books')
    .then(resp => resp.json())
    .then(books =>{
      renderBooks(books)
    })
}

function renderBooks(books){
  books.forEach(renderBook)
}

function renderBook(book){
  const pTag = document.createElement('p')
  pTag.innerText = `${book.title} - ${book.author}` 
  const bookContainer = document.getElementById('book-list')
  bookContainer.append(pTag)
}









main()
