import React from 'react';
import TodoCard from './TodoCard'

class TodoContainer extends React.Component {
  renderTodos = () => {
    return this.props.todos.map(todo => {
      return <TodoCard todo={todo} deleteTodo={this.props.deleteTodo}/>
    })
  }

  render(){
    return(
      <div>
        <h4>
          Your Todos:
        </h4>
        {this.renderTodos()}
      </div>
    )
  }
}

export default TodoContainer
