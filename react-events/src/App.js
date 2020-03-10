import React from 'react';
import logo from './logo.svg';
import './App.css';
import TodoContainer from './TodoContainer'
import FormContainer from './FormContainer'

class App extends React.Component {
  constructor(){
    super()
    this.state = {
      todos: [{description: 'washhands'}]
    }
  }

  deleteTodo= (description) => {
    const newTodos = this.state.todos.filter(todo => {
      return todo.description !== description
    })

    this.setState({todos: newTodos})


  }

  addTodo = (newTodo) => {
    this.setState({
      todos: [...this.state.todos, newTodo]
    })
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <FormContainer addTodo={this.addTodo}/>
          <TodoContainer deleteTodo={this.deleteTodo} todos={this.state.todos}/>
        </header>
      </div>
    );
  }
}

export default App;















