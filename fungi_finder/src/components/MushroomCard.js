import React from 'react'


class MushroomCard extends React.Component {

  renderEdibility = () => {
    if (this.props.mushroom.edibility === "edible") {
      return <span><i className="icon smile outline" />Edible</span>
    }
    if (this.props.mushroom.edibility === "not edible") {
      return <span><i className="icon meh outline" />Not Edible</span>
    }
    if (this.props.mushroom.edibility === "toxic") {
      return <span><i className="icon frown outline" />Toxic</span>
    }
  }

  render(){
    return(
      <div onClick={() => {this.props.clickHandler(this.props.mushroom)}} style={{marginBottom: "25px"}} className="ui column">
        <div className="ui card">

          <div className="image">
            <img style={{width: "100%", height: "250px"}} src={this.props.mushroom.image_url} />
          </div>

          <div className="content">
            <div className="header">
              {this.props.mushroom.name}
            </div>
            <div className="meta text-wrap">
              <small>{this.props.mushroom.scientific_name}</small>
            </div>
          </div>

          <div className="extra content">
            {this.renderEdibility()}
          </div>

        </div>
    </div>
    )
  }
}

export default MushroomCard
