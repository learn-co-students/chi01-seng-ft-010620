import React from 'react';
import DeleteablePainting from './DeleteablePainting';
import PaintingShow from './PaintingShow';
import Painting from './Painting';
import artworks from './artworks';
import { connect } from 'react-redux'
import { fetchPaintingsThunk } from './actions/index'

class PaintingList extends React.Component {
  componentDidMount() {
    this.props.fetchPaintingsThunk()
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
    fetchPaintingsThunk: () => {
      dispatch(fetchPaintingsThunk())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(PaintingList);








