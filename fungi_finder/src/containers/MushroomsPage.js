import React from 'react'
import MushroomsContainer from './MushroomsContainer'
import MushroomDetails from './MushroomDetails'
import importedMushroomData from '../mushrooms_data'

class MushroomsPage extends React.Component {
  constructor(){
    super()
    this.state = {
      mushrooms: importedMushroomData,
      mushroomDetail: {}
    }
  }

  clickHandler = (mushroom) => {
    this.setState({
      mushroomDetail: mushroom
    })
  }

  render(){
    return(
      <div>
        <MushroomDetails mushroomDetail={this.state.mushroomDetail}/>
        <MushroomsContainer
          mushrooms={this.state.mushrooms}
          clickHandler={this.clickHandler}
        />
      </div>
    )
  }
}

export default MushroomsPage
