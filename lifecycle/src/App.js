import React, { Component } from 'react';

import WidgetSelector from './components/WidgetSelector'
import DigitalClock from './components/DigitalClock'
import StockTicker from './components/StockTicker'
import RandomKoala from './components/RandomKoala'


class App extends Component {
  constructor(){
    super()
    this.state = {
      showClock: 'xyz'
    }
  }

  componentDidMount(){
  }

  toggleWidget = (e) => {
    console.log(e.target.value)
    this.setState( prevState => ({
      showClock: prevState.showClock + e.target.value
    }))
  }


  render() {
    return (
      <div id='app'>
        <WidgetSelector toggleWidget={this.toggleWidget} />
        { this.state.showClock ? <DigitalClock /> : <StockTicker />}
      </div>
    )
  }
}

export default App;

