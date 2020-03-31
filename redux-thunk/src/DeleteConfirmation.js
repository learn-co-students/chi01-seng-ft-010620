import React from 'react';
import {connect} from 'react-redux'
import {deletePaintings, deletePaintingThunk} from './actions/index'

const Painting = props => {
  return (
    <div className="item">
      <div className="ui small image">
        <img src={props.painting.image} alt={props.painting.slug} />
      </div>
      <div className="middle aligned content">
        <h1>Are you sure you want to remove {props.painting.title}</h1>
        <div className="ui buttons">
          <div
            onClick={props.handleCancelClick}
            className="ui basic green button"
          >
            No
          </div>
            <div className="ui red basic button" onClick={() => props.deletePaintingThunk(props.painting.id)}> Delete It</div>
        </div>
      </div>
    </div>
  );
};
            // <div className="ui red basic button" onClick={() => props.deletePainting(props.painting.id)}> Delete It</div>


const mapDispatchToProps = (dispatch) => {
  return {
    deletePainting: (id) => {
      dispatch(deletePaintings(id))
    },
    deletePaintingThunk: (id) => {
      dispatch(deletePaintingThunk(id))
    }
  }
}

export default connect(null, mapDispatchToProps)(Painting);







