import React from 'react'

class MushroomDetails extends React.Component {

  renderDetails = () => {
    if (this.props.mushroomDetail.details){
      return <p>{this.props.mushroomDetail.details}</p>
    } else {
      return <h1 style={{textAlign: "center"}}>Welcome to the Mushroom page!</h1>
    }
  }

  render(){
    return(
      <div className="ui segment inverted blue mush-details">
        {this.renderDetails()}
      </div>
    )
  }
}

export default MushroomDetails
