import React from 'react'
import Filters from './Filters'
import PetBrowser from './PetBrowser'

class App extends React.Component {
  constructor() {
    super()

    this.state = {
      pets: [],
      filters: {
        foo: 'bar',
        type: 'all'
      }
    }
  }

  onChangeType = (e) => {
    this.setState({
      filters: {
        type: e.target.value
      }
    })
  }
 
  buildUrl = () => {
    const { type } = this.state.filters

    return type === 'all' ?  '/api/pets' : `/api/pets?type=${type}`
  }
  
  onFindPetsClick= () => {
    const url = this.buildUrl()
    fetch(url)
      .then(resp => resp.json())
      .then(pets => {
        this.setState({
          pets: pets
        })
      })
  }

  onAdoptPet = (petId) => {
    // change the state of pets
    // change the isAdopted  value for a particular pet

    console.log('-----------', petId)
    const newPets = this.state.pets.map(pet => {
      if (pet.id !== petId) {
        return pet
      } else {
        return {
          ...pet,
          isAdopted: true
        }
      }
    })
    this.setState({
      pets: newPets
    })
  }

  render() {
    console.log('-----------', this.state)
    return (
      <div className="ui container">
        <header>
          <h1 className="ui dividing header">React Animal Shelter</h1>
        </header>
        <div className="ui container">
          <div className="ui grid">
            <div className="four wide column">
              <Filters 
                onFindPetsClick={this.onFindPetsClick}
                onChangeType={this.onChangeType}/>
            </div>
            <div className="twelve wide column">
              <PetBrowser 
                onAdoptPet={this.onAdoptPet}
                pets={this.state.pets}/>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default App
