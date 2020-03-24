import React from 'react';
import DeleteablePainting from './DeleteablePainting';
import PaintingShow from './PaintingShow';
import Painting from './Painting';
import artworks from './artworks';
import { connect } from 'react-redux'

class PaintingList extends React.Component {

  componentDidMount() {
    fetch('http://localhost:3000/paintings')
    .then(resp => resp.json())
    .then(paintings => {
      this.props.fetchPaintingsSuccess(paintings)
    })
    .catch(err => {
      this.props.fetchPaintingsError()
    })
  }

  handleVote = id => {
    // dispatch an action
    // add the new switch case in my reducer
  }

  render() {
    const allPaintings = this.props.paintings.map(p => (
      <DeleteablePainting
        key={p.id}
        painting={p}
        handleVote={this.handleVote}
      />
    ));

    return (
        <div>
          <h1>All Paintings</h1>
          <div className="ui items">{allPaintings}</div>
        </div>
    );
  }
}


const mapStateToProps= (state) => {
  return {
    paintings: state.paintings,
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    fetchPaintingsSuccess: (paintings) => {
      const action = {
        type: 'FETCH_PAINTINGS_SUCCESS',
        paintings: paintings
      }

      dispatch(action)
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(PaintingList);








