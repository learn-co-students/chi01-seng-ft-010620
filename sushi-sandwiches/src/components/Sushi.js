import React, { Fragment } from 'react'

const Sushi = (props) => {
  return (
    <div className="sushi">
      <div className="plate" 
        onClick={() => props.eatSushi(props.sushi)}>
        { 
          props.sushi.isEaten
          ?
            null
          :
          <img src={'https://img.favpng.com/12/14/10/sushi-cartoon-animation-png-favpng-8SqzxrejhCBi1T6WFdUSxUb67.jpg'} width="100%" />
        }
      </div>
      <h4 className="sushi-details">
        {props.sushi.name} - ${props.sushi.price}
      </h4>
    </div>
  )
}

export default Sushi
