import React from 'react';
import Navbar from './Navbar';
import PaintingList from './PaintingList';
import PaintingShow from './PaintingShow';

import Counter from './Counter';
import About from './About';

import { Route } from 'react-router-dom'

import { BrowserRouter, Switch } from 'react-router-dom'

const App = () => {
  return (
  <BrowserRouter>
    <div className="App">
      <Navbar icon="paint brush" title="Painterest" description="out app" />
        <Switch>
          <Route path="/about/:id" render={(routeParams) => {
            const user = {
              name: 'r',
              city: 'chi'
            }

            return <About {...user} user={user} />

          }} />

          <Route path="/" component={PaintingList} />
        </Switch>
    </div>
  </BrowserRouter>
  );
};

export default App;
