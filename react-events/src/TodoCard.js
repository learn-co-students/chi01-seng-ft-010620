import React from 'react';

class TodoCard extends React.Component {
  render(){
    console.log(this.props)
    return(
      <div style={{border: '2px solid black'}}>
        <h6>{this.props.todo.description}</h6>
          <button onClick={() => this.props.deleteTodo(this.props.todo.description)}>delete</button>
      </div>
    )
  }
}

export default TodoCard
