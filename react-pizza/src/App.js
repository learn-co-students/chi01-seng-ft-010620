import React, { Component, Fragment } from 'react';
import Header from './components/Header'
import PizzaForm from './components/PizzaForm'
import PizzaList from './containers/PizzaList'


const keyToChange = 'name'





class App extends Component {
  constructor(){
    super()
    this.state = {
      pizzas: [],
      editPizza: {}
    }
  }

  handleChange= (e) => {
    if (e.target.name === 'vegetarian') {
      this.setState({
        editPizza: {
          ...this.state.editPizza,
          vegetarian: e.target.value === 'Vegetarian'
        }
      })
    }
    else {
      this.setState({
        editPizza: {
          ...this.state.editPizza,
          [e.target.name]: e.target.value
        }
      })
    }
  }


  componentDidMount(){
    fetch('http://localhost:3000/pizzas')
    .then(resp => resp.json())
    .then(pizzaArr => {
      this.setState({
        pizzas: pizzaArr
      })
    })
  }

  editPizza = (pizza) => {
    this.setState({
      editPizza: pizza
    })
  }

  saveEdit = () => {
    const reqObj = {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(this.state.editPizza)
    }

    fetch(`http://localhost:3000/pizzas/${this.state.editPizza.id}`, reqObj)
      .then(resp => resp.json())
      .then(updatedPizza => {
        // map over this.state.pizzas and swap out the editpizza that just got updated
        const newPizzas = this.state.pizzas.map(pizza => {
          if (pizza.id === updatedPizza.id) {
            return updatedPizza
          } else {
            return pizza
          }
        })

        this.setState({
          pizzas: newPizzas
        })

      })
  }

  render() {
    console.log(this.state)
    return (
      <Fragment>
        <Header/>
          <PizzaForm 
            editPizza={this.state.editPizza} 
            saveEdit={this.saveEdit}
            handleChange={this.handleChange} />
        <PizzaList 
          pizzas={this.state.pizzas} 
          editPizza={this.editPizza}/>
      </Fragment>
    );
  }
}

export default App;
