import React, { Component } from 'react';
import SushiContainer from './containers/SushiContainer';
import Table from './containers/Table';

// Endpoint!  
const API = "http://localhost:3000/sushis"

class App extends Component {
  constructor(){
    super()
    this.state = {
      sushis: [],
      page: 0,
      budget: 100
    }
  }

  componentDidMount(){
    fetch(API)
    .then(resp => resp.json())
    .then(sushis => {
      const updatedSushis = sushis.map(sushiObj => {
        return {
          ...sushiObj,
          isEaten: false
        }
      })



      this.setState({
        sushis: updatedSushis
      })
    })
  }

  changePage = () => {
    this.setState({
      page: this.state.page + 1
    })
  }

  eatSushi = (eatenSushi) => {
    if (this.state.budget < eatenSushi.price) {
      alert('no money')
      return
    }



    const updatedSushis = this.state.sushis.map(sushi => {
      if (sushi.id === eatenSushi.id) {
        // update that sushi
        return {
          ...sushi,
          isEaten: true
        }
      } else {
        // not the sushi i need to update
        // therefore just return that sushi
        return sushi
      }
    })



    this.setState({
      sushis: updatedSushis,
      budget: this.state.budget - eatenSushi.price
    })

  }

  findEatenSushis = () => {
    return this.state.sushis.filter(sushi => sushi.isEaten)
  }


  render() {
    const slicedSushis = this.state.sushis.slice(this.state.page * 4, (this.state.page * 4) + 4)

    return (
      <div className="app">
        <SushiContainer  sushis={slicedSushis} changePage={this.changePage} eatSushi={this.eatSushi} />
        <Table budget={this.state.budget} eatenSushis={this.findEatenSushis()}/>
      </div>
    );
  }
}

export default App;
