import React, { Fragment } from 'react'
import MoreButton from '../components/MoreButton'
import Sushi from '../components/Sushi'

const SushiContainer = (props) => {
  return (
    <Fragment>
      <div className="belt">
        {
          props.sushis.map(sushi => {
            return <Sushi eatSushi={props.eatSushi} sushi={sushi} />
          })
        }
        <MoreButton changePage={props.changePage}/>
      </div>
    </Fragment>
  )
}

export default SushiContainer







