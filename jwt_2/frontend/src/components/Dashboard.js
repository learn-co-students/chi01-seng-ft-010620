
import React from 'react';

class Dashboard extends React.Component {
  componentDidMount(){
    //verify token
  }

  render(){
    return (
        <div className="App">
          <Switch>
            <Route path='/dashboard/users' component={About} />
            <Route path='/dashboard/edit/:id' component={Login} />
          </Switch>
        </div>
      </BrowserRouter>
    );
  }
};

export default App;
