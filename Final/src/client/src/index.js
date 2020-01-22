import ApolloClient from 'apollo-boost';
import React from 'react';
import { ApolloProvider } from '@apollo/react-hooks';
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App';

const client = new ApolloClient({
    uri: 'http://localhost:4000',
    headers: {
      authorization:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYWJhcmR5In0.Cq0xUCKQw9qYiKS8Q1f0pBvdWDhIH9nk9yo1YBjoNwE',
    },
  });
  
ReactDOM.render(
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>,
    document.getElementById('root'),
  );
  