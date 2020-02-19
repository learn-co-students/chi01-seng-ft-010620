document.addEventListener('DOMContentLoaded', function(){
  createFormListener()
  createClickListener()
})


function createClickListener(){
  const commentContainer = document.querySelector('#comments-container')

  commentContainer.addEventListener('click', function(event){
    if(event.target.className === 'delete-btn') {
      event.target.parentNode.remove()
      console.log('deletebtn')
    }
    // check if theat node got clicked has the class 'delete-btn'
    //
  })






  // grab the div where the comments live
  // add an eventlistener to that div for a click
  //
  //

}

function createFormListener(){
  const form = document.querySelector('form')
  form.addEventListener('submit', function(event){
    event.preventDefault()

    const newComment = event.target[0].value


    const liTag = document.createElement('li')
    liTag.innerText = newComment

    const deleteBtn = document.createElement('button')
    deleteBtn.className = 'delete-btn'
    deleteBtn.innerText = 'X'


    liTag.append(deleteBtn)


    const commentContainer = document.querySelector('#comments-container')
    commentContainer.append(liTag)
    form.reset()
  })



}


// grab the form from the html
// set an eventlistener (submit)
// 
// scrape the comment from the input field
// create a ptag and add the comment into the ptag
// we append the ptag into the #comments-container node


























  // const consoleBtn = document.getElementById('console-btn')
  // consoleBtn.addEventListener('click', function(){
    // console.log('btn got clickedd')
  // })


  // const alertBtn = document.getElementById('alert-btn')
  // alertBtn.addEventListener('click', function(){
    // alert('foo')
  // })

