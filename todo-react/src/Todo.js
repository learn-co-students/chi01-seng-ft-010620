import React from 'react';

class Todo extends React.Component {
  render() {
    const {description, id, important, completeTodo, toggleImportance} = this.props

    const style = important ? { color: 'yellow'} : {color: 'white'}
    return (
      <div>
        <h4 style={style}>{description}</h4>
          { 
            important ? 
            <button onClick={() => toggleImportance(id, important)}> Mark as not Important</button> : 
            <button onClick={() => toggleImportance(id, important)}> Mark as Important</button>
          }
          <button onClick={() => completeTodo(id)}>Complete</button>
      </div>
    );
  }
}

export default Todo;
