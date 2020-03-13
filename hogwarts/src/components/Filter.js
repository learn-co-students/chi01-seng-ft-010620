import React from 'react'


class Filter extends React.Component {
  render(){
    const style={ 
      margin: '25px',
      padding: '30px',
      border: '1px solid black'
    }

    return <div className='ui eight wide column' style={style}>
       <input
          name="isGoing"
          type="checkbox"
          onChange={this.props.toggleGreased} />
        Greased
       <br />
       <select onChange={this.props.handleSort}>
         <option value=''></option>
         <option value='name'>name</option>
         <option value='weight'>weight</option>
       </select>
    </div>
  }
}

export default Filter 

