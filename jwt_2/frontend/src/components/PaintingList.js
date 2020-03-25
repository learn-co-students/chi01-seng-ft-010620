import React from 'react';
import DeleteablePainting from './DeleteablePainting';
import { Route, Switch } from 'react-router-dom';
import PaintingShow from './PaintingShow';
import Painting from './Painting';
import { connect } from 'react-redux'
import { thunkFetchPaintings } from '../actions/index'



class PaintingList extends React.Component {
  state = { foo: 'bar'}
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.thunkFetchPaintings()
  }

  handleVote = (id) => {
    this.setState(prevState => {
      return {
        paintings: prevState.paintings.map(p => {
          if (p.id !== id) {
            return p;
          } else {
            return { ...p, votes: p.votes + 1 };
          }
        })
      };
    });
  }

  renderPaintings(){
    const allPaintings = this.props.paintings.map(p => (
      <DeleteablePainting
        key={p.id}
        painting={p}
        handleVote={this.handleVote}
      />
    ));

    return <div>
        <h1>All Paintings</h1>
        <div className="ui items">{allPaintings}</div>
    </div>
  }

  render() {
    return (
      <Switch>
        <Route path='/paintings/:paintingId' render={(route) => {
          const id = route.match.params.paintingId
          const painting = this.state.paintings.find(painting => painting.id == id)
          return <PaintingShow painting={painting}/>
        }} />
        <Route path='/'  render={()=>{
          return <div>
            { this.props.loader ? <h2>LOADING...</h2> : this.renderPaintings() }
          </div>
        }}
        />
      </Switch>

    );
  }
}

const mapStateToProps = (state) => {
  return {
    paintings: state.paintings,
    loader: state.loader
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    thunkFetchPaintings: () => {
      dispatch(thunkFetchPaintings())
    }
  }
}


export default connect(mapStateToProps, mapDispatchToProps)(PaintingList);










