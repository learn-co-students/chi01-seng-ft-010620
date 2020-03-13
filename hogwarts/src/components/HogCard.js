import React from 'react'


class HogCard extends React.Component {
  constructor(){
    super()
    this.state ={
      showDetails: false
    }
  }

  renderImage = () => {
    const imageName = this.props.hog.name.replace(/ /g, "_").toLowerCase()
    const img_src = require(`../hog-imgs/${imageName}.jpg`)

    return <img src={img_src} onClick={this.toggleDetails} />
  }

  toggleDetails = () => {
    this.setState( prevState => ({
      showDetails: !prevState.showDetails
    }))
  }


  renderDetails = () => {
    const { weight, specialty } = this.props.hog
    return <div>
        <p>
          weight: {weight}
        </p>
        <p>
          specialty: {specialty}
        </p>
    </div>
  }

  renderHog = () => {
    const { name, isHidden } = this.props.hog
    return <div className='ui eight wide column'>
      <h4>
        {name}
      </h4>
        <button onClick={() => this.props.hideHog(name)}>hide hog</button>
        {this.renderImage()}
        {this.state.showDetails ? this.renderDetails() : null}
    </div>
  }

  render(){
    const { name, isHidden } = this.props.hog

    return {isHidden ? null : this.renderHog() }
  }
}

export default HogCard

