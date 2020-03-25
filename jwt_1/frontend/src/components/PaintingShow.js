import React from 'react';

const PaintingShow = props => {
  return (
    <div className="App">
      <h4>THIS IS THE PAINTING SHOW PAGE</h4>
      <img src={props.painting.image} />
      <h4>{props.painting.id}</h4>
    </div>
  );
};

export default PaintingShow;
