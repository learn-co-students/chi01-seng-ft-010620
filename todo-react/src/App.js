import React from 'react';
import logo from './logo.svg';
import './App.css';
import TodoForm from './TodoForm'
import TodosList from './TodosList'

class App extends React.Component {
  constructor() {
    super()
    this.state = {
      todos: []
    }
  }

  componentDidMount(){
    fetch('http://localhost:3000/todos')
    .then(resp => resp.json())
    .then(todos => {
      this.setState({
        todos: todos
      })
    })
  }

  completeTodo = (id) => {
    const reqObj ={
      method: 'PATCH',
      headers: { 
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({completed: true})
    }

    fetch(`http://localhost:3000/todos/${id}`, reqObj)
    .then(resp => resp.json())
    .then(updatedTodo => {
      const newTodos = this.state.todos.map(todo => {
        if (todo.id === updatedTodo.id){
          return updatedTodo
        } else {
          return todo
        }
      })

      this.setState({
          todos: newTodos
      })

    })
  }

  toggleImportance = (id, currentImportance) => {
    const reqObj ={
      method: 'PATCH',
      headers: { 
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({important: !currentImportance})
    }

    fetch(`http://localhost:3000/todos/${id}`, reqObj)
    .then(resp => resp.json())
    .then(updatedTodo => {
      const newTodos = this.state.todos.map(todo => {
        if (todo.id === updatedTodo.id){
          return updatedTodo
        } else {
          return todo
        }
      })

      this.setState({
          todos: newTodos
      })

    })
    // map over all the todos 
    // find the right dodo Object
    // and flip the value of it's important key
    // make a patch request so that it is saved
  }

  filterTodos = () => {
    return this.state.todos.filter(todo => !todo.completed)
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <TodoForm />
          <TodosList todos={this.filterTodos()} completeTodo={this.completeTodo} toggleImportance={this.toggleImportance}/>
        </header>
      </div>
    );
  }
}

export default App;
