const { gql } = require('apollo-server');

const GET_USERS = gql `
  query {
  users {
    id
    username
    createdAt
    displayName
    bio
    photo
    tweets {
      createdAt
      tweet
    }
  }
}
`;

const GET_USERS_BY_USERNAME = gql `
query getUserByUsername($username: String!) {
    user(username: $username) {
      id
      username
      displayName
      bio
      photo
      tweets(first:1) {
        id
        tweet
      }
    }
  }
`;

const GET_TWEETS = gql `
query {
  tweets {
    id
    createdAt
    tweet
    from {
      id
      username
      createdAt
      displayName
      bio
      email
      photo
    }
  }
}`;

const CREATE_TWEET = gql `
mutation createTweet($from: String!, $tweet: String!) {
  createTweet(from: $from, tweet: $tweet) {
      id
      tweet
      createdAt
      from {
        id
      username
      createdAt
      displayName
      bio
      photo      
      }
    }
  }
`;

module.exports = {
    GET_USERS,
    CREATE_TWEET,
    GET_USERS_BY_USERNAME,
    GET_TWEETS
}