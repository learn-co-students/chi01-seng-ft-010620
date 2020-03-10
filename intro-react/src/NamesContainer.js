import React from 'react'


class NamesContainer extends React.Component {

  renderAllNames = () => (
    this.props.names.map(name => <p>{name}</p>)
  )

  render() {
    console.log(this.props)
    return <div>
      {this.renderAllNames()}
    </div>
  }
}


export default NamesContainer


