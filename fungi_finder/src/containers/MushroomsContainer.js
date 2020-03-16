import React from 'react'
import MushroomCard from '../components/MushroomCard'



class MushroomsContainer extends React.Component {

  renderMushroomCards = () => {
    return this.props.mushrooms.map(mushroom => {
      return <MushroomCard mushroom={mushroom} clickHandler={this.props.clickHandler}/>
    })
  }

  render(){
    return(
      <div>
				 <div className="ui four column grid">
					<div className="row">
            {this.renderMushroomCards()}
					</div>
  	  	</div>
			</div>
    )
  }
}

export default MushroomsContainer
