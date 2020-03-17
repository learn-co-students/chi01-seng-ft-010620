import React from 'react';
import Todo from './Todo'

class TodosList extends React.Component {

  renderTodos = () => {
    return this.props.todos.map(todo => {
      return <Todo {...todo} completeTodo={this.props.completeTodo} toggleImportance={this.props.toggleImportance}/>
    })
    
  }

  render() {
    return (
      <div>
        {this.renderTodos()}
      </div>
    );
  }
}

export default TodosList;
