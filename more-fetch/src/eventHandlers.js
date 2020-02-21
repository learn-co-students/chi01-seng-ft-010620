const foo = ['r', 'k'].filter(function(el){
  return el === 'r'
})

function handleSearchInput(event, allPokemonData, pokemonContainer) {
  console.log('safasd')
  const filteredPokes = allPokemonData.filter(pokeObj => {
    return pokeObj.name.includes(event.target.value.toLowerCase())
  })
  const filteredPokeHTML = renderAllPokemon(filteredPokes)  
  pokemonContainer.innerHTML = filteredPokeHTML ? filteredPokeHTML : `<p><center>There are no Pokémon here</center></p>`
}


function handleClick(event, allPokemonData) {
  if (event.target.dataset.action === 'flip') {
    const clickedPokemon = allPokemonData.find((pokemonObject) => pokemonObject.id == event.target.parentNode.parentNode.dataset.id)
    event.target.src = (event.target.src === clickedPokemon.sprites.front ? clickedPokemon.sprites.back : clickedPokemon.sprites.front)
  } else if (event.target.dataset.action === 'delete') {
    const pokeId = event.target.parentNode.dataset.id
    event.target.parentNode.parentNode.remove()

    fetch(`http://localhost:3000/pokemon/${pokeId}`, {method: 'DElETE'})
    .then(resp => resp.json())

    // remove the card that the delete  btn (grandparent)
    // make a fetch request to detel that pokemon from the db
  }
}


function handleCreatePokemon(event, pokemonContainer){
  event.preventDefault()
  console.log('adsfasd', event.target[0])

  const formData = {
    name: event.target[0].value,
    sprites: {
      front: event.target[1].value
    }
  }
  event.target.reset()

  const reqObj = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(formData)
  }

  fetch('http://localhost:3000/pokemon', reqObj)
    .then(resp => resp.json())
    .then(jsonData => {
      const pokeCard = renderSinglePokemon(jsonData)
      pokemonContainer.insertAdjacentHTML( 'beforeend', pokeCard);
    })

}

/************************* Helper Fns for Producing HTML **********************/


function renderAllPokemon(pokemonArray) {
  return pokemonArray.map(renderSinglePokemon).join('')
}

function renderSinglePokemon(pokemon) {
  return (`
  <div class="pokemon-card">
    <div class="pokemon-frame" data-id="${pokemon.id}">
      <h1 class="center-text">${pokemon.name}</h1>
      <div class="pokemon-image">
        <img  data-action="flip" class="toggle-sprite" src="${pokemon.sprites.front}">
      </div>
      <button  data-action="delete" class="pokemon-button">Delete</button>
    </div>
  </div>`)
}
