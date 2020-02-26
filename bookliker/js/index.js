// You can like a book by clicking on a button. You are user 1 {"id":1, "username":"pouros"}, so to like a book send a PATCH request to http://localhost:3000/books/:id with an array of users who like the book. This array should be equal to the existing array of users that like the book, plus your user. For example, if the previous array was "[{"id":2, "username":"auer"}, {"id":8, "username":"goodwin"}], you should send as the body of your PATCH request:

// add an event to the listener to the button
// assemble the request Object for the patch req
// make a fetch (PATCH)
// //update DOM



function main(){
  fetchBooks()
  createClickListener()
}

function createClickListener(){
  const unorderedList = document.querySelector('#list')
  unorderedList.addEventListener('click', function(e){
    const bookId = e.target.dataset.id
    fetch(`http://localhost:3000/books/${bookId}`)
    .then(resp => resp.json())
    .then(bookObj => {
      console.log(bookObj)
      const showPanel = document.getElementById('show-panel')
      showPanel.innerHTML= ''


      const header = document.createElement('h2')
      header.innerText = bookObj.title

      const image = document.createElement('img')
      image.src = bookObj.img_url

      const description = document.createElement('p')
      description.innerText = bookObj.description


      const readersList = document.createElement('ul')

      bookObj.users.forEach(function(userObj){
        const reader = document.createElement('li')
        reader.innerText = userObj.username
        readersList.append(reader)
      })

      const button = document.createElement('button')
      button.innerText = 'read book'




      button.addEventListener('click', function(e){

        const newUsers= bookObj.users
        newUsers.push({"id":1, "username":"pouros"})
        
        const formData = {
          users: newUsers
        }

        const reqObj = {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        }

        fetch(`http://localhost:3000/books/${bookId}`, reqObj)
          .then(resp => resp.json())
          .then(bookObj => {
            const reader = document.createElement('li')
            reader.innerText = bookObj.users.pop().username
            readersList.append(reader)
          })
      })



      showPanel.append(header, image, description, button, readersList)

    })
  })



}


function fetchBooks(){
  fetch('http://localhost:3000/books')
  .then(resp => resp.json())
  .then(bookArr => {
    const unorderedList = document.querySelector('#list')

    bookArr.forEach(function(bookObj){
      const listItem = document.createElement('li')
      listItem.className = 'book-item'
      listItem.innerText = bookObj.title
      listItem.dataset.id = bookObj.id

      unorderedList.append(listItem)


    })
  })
}



main()
