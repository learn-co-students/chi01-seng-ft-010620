import React from 'react'
import HogCard from './HogCard'


// class HogContainer extends React.Component {

  // renderHogs = () => {
      // return props.hogs.map(hogObj => {
        // return <HogCard hog={hogObj} key={hogObj.name} />
      // })
    // return   }

  // render(){
    // return <div className='ui grid container'>
      // {this.renderHogs()}
    // </div>
  // }
// }


const HogContainer = props => {
  return <div className='ui grid container'>
    {
      props.hogs.map(hogObj => {
        return <HogCard hog={hogObj} hideHog={props.hideHog} key={hogObj.name} />
      })
    }
  </div>
}


export default HogContainer

