const BASE_URL = "http://localhost:3000"
const TRAINERS_URL = `${BASE_URL}/trainers`
const POKEMONS_URL = `${BASE_URL}/pokemons`
const mainEl = document.querySelector('main')


function main(){
  fetchTrainers()
  createButtonListener()
}

function createButtonListener(){
  mainEl.addEventListener('click', function(e){
    if(e.target.className === 'add') {
      addNewPokemon(e)
    } else if(e.target.className === 'release') {
      releasePokemon(e)
    }
  })
}

function releasePokemon(e){
  const pokeId = e.target.dataset.pokemonId
  const reqObj = {
    method: 'DELETE'
  }

  fetch(`${POKEMONS_URL}/${pokeId}`, reqObj)
    .then(resp => resp.json())
    .then(data => {
      e.target.parentNode.remove()
    })
}


function addNewPokemon(e){
  const uList = e.target.nextSibling
  if (uList.childElementCount > 5) {
    return
  } 

  const formData = {
    trainer_id: e.target.dataset.trainerId
  }



  const reqObj = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }, 
    body: JSON.stringify(formData)
  }

  fetch(POKEMONS_URL, reqObj)
  .then(resp => resp.json())
  .then(pokemon => {

    const li = document.createElement('li')
    li.innerHTML = `${pokemon.nickname} (${pokemon.species})`

    const removeBtn = document.createElement('button')
    removeBtn.innerHTML = 'Release'
    removeBtn.className = 'release'
    removeBtn.dataset.pokemonId = pokemon.id

    li.append(removeBtn)

    uList.append(li)
  })
}




function fetchTrainers(){
  fetch(TRAINERS_URL)
  .then(resp => resp.json())
  .then(trainers => {
    console.log(trainers)

    renderTrainers(trainers)
  })
}




function renderTrainers(trainers){
  trainers.forEach(function(trainer){
    renderTrainer(trainer)
  })
}

function renderTrainer(trainer){

  const cardDiv = document.createElement('div')
  cardDiv.className = 'card'
  cardDiv.dataset.id = trainer.id

  const nameP = document.createElement('p')
  nameP.innerHTML = trainer.name

  const addBtn = document.createElement('button')
  addBtn.innerHTML = 'add pokemon'
  addBtn.className = 'add'
  addBtn.dataset.trainerId = trainer.id

  const uList = document.createElement('ul')

  trainer.pokemons.forEach(function(pokemon){
    const li = document.createElement('li')
    li.innerHTML = `${pokemon.nickname} (${pokemon.species})`

    const removeBtn = document.createElement('button')
    removeBtn.innerHTML = 'Release'
    removeBtn.className = 'release'
    removeBtn.dataset.pokemonId = pokemon.id

    li.append(removeBtn)

    uList.append(li)
  })





  cardDiv.append(nameP, addBtn, uList)
  mainEl.append(cardDiv)
}



main()






