import React from 'react'
import NamesContainer from './NamesContainer'


class WelcomeContainer extends React.Component {
  constructor(){
    super()
    this.state = {
      names: ['cesar', 'max', 'John']
    }
  }

  render() {
    return (
      <div>
        <h2> Welcome Container </h2>
          <NamesContainer names={this.state.names}/>
      </div>
    )
  }
}



export default WelcomeContainer


























