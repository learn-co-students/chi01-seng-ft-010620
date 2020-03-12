import React, { Component } from 'react'

class DigitalClock extends Component {
  constructor(){
    super()
    const date = new Date()
    const time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds()

    this.state = {
      time: time,
      intervalId: null
    }
  }

  componentDidMount(){
    const intervalId = setInterval(() => {
      const date = new Date()
      const time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds()

      this.setState({
        time: time
      })

    }, 1000)


    this.setState({
      intervalId: intervalId
    })
  }

  componentWillUnmount(){
    clearInterval(this.state.intervalId)
  }


  render () {
    return (
      <div className="app-children">
        <h2 id="digital">
          {this.state.time}
        </h2>
      </div>
    )
  }
}

export default DigitalClock
