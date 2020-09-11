import React from "react";
import client from "./client";
import { ApolloProvider } from "react-apollo";

import PoemList from './PoemList';

const Virgil = () => {
  return (
    <ApolloProvider client={client}>
      <PoemList/>
    </ApolloProvider>
  );
};

export default Virgil;