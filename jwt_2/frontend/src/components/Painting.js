import React from 'react';
import { Link } from 'react-router-dom';

const Painting = props => {
  // console.log('Painting props', props);
  return (
    <div className="item">
      <div className="ui small image">
        <img src={props.painting.image} alt={props.painting.slug} />
      </div>
      <div className="middle aligned content">
        <div className="header">{`"${props.painting.title}" by ${props.painting
          .artist.name}`}</div>
        <div className="description">
          <a onClick={() => props.handleVote(props.painting.id)}>
            <i className="large caret up icon" />
            {props.painting.votes} votes
          </a>
        </div>
        <div onClick={props.handleDelete} className="ui red basic button">
          Delete It
        </div>
        <Link to={`/paintings/${props.painting.id}`} className="ui basic button">
          View
        </Link>
      </div>
    </div>
  );
};
export default Painting;
