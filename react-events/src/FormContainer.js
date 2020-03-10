import React from 'react'


class FormContainer extends React.Component {
  constructor(){
    super()
    this.state = {
      description: ''
    }
  }

  handleInput = (e) => {
    this.setState({
      description: e.target.value
    })
  }

  handleSubmit = (e) => {
    e.preventDefault()
    const newTodo = { description: this.state.description }
    this.props.addTodo(newTodo)

    this.setState({
      description: ''
    })
  }

  render() {
    return <div>
      <form onSubmit={this.handleSubmit}> 
        <input onChange={this.handleInput} type='text' value={this.state.description} />
        <input type='submit' value='add todo'/>
      </form>
    </div>
  }
}

export default FormContainer
