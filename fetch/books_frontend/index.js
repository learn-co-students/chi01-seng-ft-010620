function fetchBooks(){
  fetch('http://localhost:3000/books')
    .then((resp) => resp.json())
    .then((data) => {
      renderBooks(data)
    })
    .catch((err) => console.log('err', err))
}

function postBook(formData){
  const reqObj = {
    method: 'POST', 
    headers: { 'Content-type': 'application/json' },
    body: JSON.stringify(formData)
  }

  fetch('http://localhost:3000/books', reqObj)
    .then((resp) => resp.json())
    .then((data) => console.log(data))
    .catch((err) => console.log(err))
}

function renderBooks(bookData){
  bookData.forEach((book) => {
    const bookEl = buildBookElement(book)
    const bookList = document.querySelector('#book-list')
    bookList.append(bookEl)
  })
}

function buildBookElement(book){
  const bookDiv = document.createElement('div')
  const nameP = document.createElement('p')
  nameP.innerHTML = book.title + ' - ' + book.author
  bookDiv.append(nameP)
  return bookDiv
}



function addFormListener(){
  const formEl = document.querySelector('form')
  formEl.addEventListener('submit', (event) => {
    event.preventDefault();
    const formData = grabFormData()
    postBook(formData)
  })
}

function grabFormData(){
  const author = document.querySelector('#form-author').value
  const title = document.querySelector('#form-title').value
  return { author, title}
}


function main(){
  fetchBooks()
  addFormListener()
}

main()
