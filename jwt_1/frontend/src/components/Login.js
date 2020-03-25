import React from 'react';
import { connect } from 'react-redux'

class Login extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      username: 'raza',
      password: 'hello',
    }
  }

  handleInputChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value
    })
  }

  handleSubmit = (e) => {
    e.preventDefault()

    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(this.state)
    }


    fetch('http://localhost:3000/api/v1/auth', reqObj)
    .then(resp => resp.json())
    .then(data => {
      if (data.error) {
        alert(data.error)
      } else {
        this.props.loginSuccess(data)
        this.props.history.push('/about')
      }

      // check if is success:
      //   update the authenticated user the store
      //   redirect to the about page
      // if no success:
      //   alert
    })




    // prevent default

    //  send a request to the backend to verify if the user exists and the password matches
    //  if it does
    //     save the user that comes back in our redux store
    //  if it does not
    //     let user know that the cred are invalid
  }

  render(){
    console.log('-----------', this.props)
    return (
      <div>
        <h3>Sign in</h3>
        <form onSubmit={this.handleSubmit}>
          <input name={'username'} onChange={this.handleInputChange} value={this.state.username} />
          <input name={'password'} onChange={this.handleInputChange} value={this.state.password} />
          <input type='submit' value='login' />
        </form>
      </div>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    loginSuccess: (user) => {
      const action = {
        type: "LOGIN_SUCCESS",
        user: user
      }

      dispatch(action)
    }
  }
}


export default connect(null, mapDispatchToProps)(Login);






