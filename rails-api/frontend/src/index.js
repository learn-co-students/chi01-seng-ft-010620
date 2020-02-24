// X fetch animals from rails be -> render them in the table
//
// have the abiltiy to create new animals/species and have them persist /rendered
//
//   add eventListener to form for a submit
//   once submitted:
//    prevent default
//    scrape the form data
//    post fetch the form data to the back end
//    render the new animal to the table
//

const genderMap = {
  0: 'male',
  1: 'female', 
  2: 'unknown'
}

function main() {
  document.addEventListener('DOMContentLoaded', function(){
    fetchAnimals()
    addFormListener()
  })
}

function addFormListener(){
  const form = document.querySelector('form')
  form.addEventListener('submit', function(e){
    e.preventDefault()
    const formData = {
      name: e.target[0].value,
      gender: e.target[1].value,
      species: e.target[2].value,
    }

    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    }


    const animal = {
      name: formData.name,
      species: formData.species,
      gender: genderMap[formData['gender']]
    }
    console.log(animal)

    renderAnimal(animal)

    fetch('http://localhost:3000/animals', reqObj)
      .then(resp => resp.json())
      .then(animal => {
        console.log(animal)
        // handle a failure potentially
      })

  })
}

function renderAnimal(animal){
    const tbody = document.querySelector('tbody')

    const tr = document.createElement('tr')

    const nameCell  = document.createElement('td')
    nameCell.innerText = animal.name

    const genderCell  = document.createElement('td')
    genderCell.innerText = animal.gender

    const speciesCell  = document.createElement('td')
    speciesCell.innerText = animal.species

    tr.append(nameCell, genderCell, speciesCell)

    tbody.append(tr)
}



function fetchAnimals(){
  fetch('http://localhost:3000/animals')
    .then(resp => resp.json())
    .then(animals => {
      console.log('data', animals)
      renderAnimals(animals)
    })

  // loop over the array of animals
  // create a tr for each animal object
}

function renderAnimals(animals){
  animals.forEach(function(animal){
    renderAnimal(animal)
  })
}


main()


