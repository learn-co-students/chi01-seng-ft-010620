import React, { Component } from 'react'

class StockTicker extends Component {
  constructor(){
    super()
  }

  componentDidMount(){
  }



  render () {
    return (
      <div className="app-children">
        <div id="ticker">
          <h2>Flatiron</h2>
          <div>
            54 
          </div>
        </div>
      </div>
    )
  }
}

export default StockTicker
