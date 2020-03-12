import React, { Component } from 'react'

class RandomKoala extends Component {
  render () {
    return (
      <div className="app-children">
        { 
          this.props.koalas.map(koala => {
            return <img  src={koala.image_url} />
          })
        }
      </div>
    )
  }
}

export default RandomKoala
