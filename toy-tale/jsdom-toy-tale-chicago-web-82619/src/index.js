let addToy = false;


// find a form
// listen for a submit on the form
// once submitted:
//  prevent default
//  scrape the data off the form
//  reset the form
//  send a post request with all of the form data headers etc.
//
//  render the newly created toy

document.addEventListener("DOMContentLoaded", () => {

  handleToggleForm()
  createFormListener()
  createLikeListener()
  fetchToys()
});


function createLikeListener(){
  const toyContainer = document.querySelector('#toy-collection')
  toyContainer.addEventListener('click', function(e){
    if (e.target.tagName === 'BUTTON') {
      const toyId = e.target.dataset.id
      const likes = ++e.target.dataset.likes
      const url = 'http://localhost:3000/toys/' + toyId

      const reqObj = {
        method: 'PATCH',
        headers: {
           "Content-Type": "application/json",
        },
        body: JSON.stringify({"likes": likes})
      }

      fetch(url, reqObj)
        .then(resp => resp.json())
        .then(data => {
          e.target.dataset.likes = likes
          e.target.previousSibling.innerHTML = `${likes} Likes`
        })
    }
  })
}

function createFormListener(){
  const form = document.querySelector('form')
  form.addEventListener('submit', function(e){
    e.preventDefault()
    const formData = {
      name: e.target[0].value,
      image: 'https://cdn140.picsart.com/244090226021212.png?r1024x1024',     // e.target[1].value,
      likes: 0
    }

    form.reset()

    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    }



    fetch('http://localhost:3000/toys', reqObj)
      .then(resp => resp.json())
      .then(toy => {
        const toyContainer = document.querySelector('#toy-collection')
        const toyCard = `<div class="card"><h2>${toy.name}</h2><img src=${toy.image} class="toy-avatar" /><p>${toy.likes} Likes</p><button data-likes=${toy.likes} data-id=${toy.id} class="like-btn">Like <3</button></div>`

        toyContainer.innerHTML += toyCard
      })

  })
}


function fetchToys(){
  fetch('http://localhost:3000/toys')
  .then(resp => resp.json())
  .then(toys => {
    const toyContainer = document.querySelector('#toy-collection')
    toys.forEach(function(toy){
      const toyCard = `<div class="card"><h2>${toy.name}</h2><img src=${toy.image} class="toy-avatar" /><p>${toy.likes} Likes</p><button data-likes=${toy.likes} data-id=${toy.id} class="like-btn">Like <3</button></div>`
      toyContainer.innerHTML += toyCard
    })
  })
}











function handleToggleForm(){
  const toyForm = document.querySelector(".container");
  const addBtn = document.querySelector("#new-toy-btn");

  addBtn.addEventListener("click", () => {
    // hide & seek with the form
    addToy = !addToy;
    if (addToy) {
      toyForm.style.display = "block";
    } else {
      toyForm.style.display = "none";
    }
  });
}

// two options to add new html:
//
// #createElement
// 1. create individual nodes 
//    add the attr they require
//    then append it all in
//    then appendChild
//
// 2. create a string with all of necessary html
//    and then add that string of html 
//    using innerHTML
//    or insertAdjacentHTML


// listening for buttons that there are multiples of
// there are two approaches: 
//  1) add an event listener to each individual button node
//
//  2) add an event listener a parent div that you know will hold all of the buttons







