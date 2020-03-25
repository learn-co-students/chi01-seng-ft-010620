import React from 'react';
import Navbar from './Navbar';
import PaintingList from './PaintingList';
import PaintingShow from './PaintingShow';
import { Route, Switch } from 'react-router-dom';
import Counter from './Counter';
import About from './About';
import Login from './Login';
import { BrowserRouter } from 'react-router-dom';

const App = () => {
  return (
    <BrowserRouter>
      <div className="App">
          <Navbar icon="paint brush" title="Painterest" description="out app" />
        <Switch>
          <Route path='/about' component={About} />
          <Route path='/login' component={Login} />
        </Switch>
      </div>
    </BrowserRouter>
  );
};

export default App;
