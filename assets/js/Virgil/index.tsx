import React from "react";
import client from "./client";
import { ApolloProvider } from "react-apollo";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";

import Poems from './Poems';

const Virgil = () => {
  return (
    <ApolloProvider client={client}>
      <BrowserRouter>
        <div>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
            <li>
              <Link to="/poems">Poems</Link>
            </li>
          </ul>

        <Switch>
          <Route path="/about">
            <h1>Hello from About!</h1>
          </Route>
          <Route path="/poems">
            <Poems/>
          </Route>
        </Switch>
        </div>
      </BrowserRouter>
    </ApolloProvider>
  );
};

export default Virgil;