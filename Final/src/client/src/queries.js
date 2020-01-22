import { gql } from 'apollo-boost';

export const createTweetMutation = gql`
mutation createTweet($tweet: String!, $from: String!) {
  createTweet(tweet: $tweet, from: $from) {
    id
    tweet
    createdAt
    from {
      id
      username
      displayName
    }
  }
}
`;

export const allTweetsQuery = gql`
query getAllTweets {
  tweets {
    id
    tweet
    createdAt
    from {
      id
      username
      displayName
      photo
    }
  }
}
`;

export const userQuery = gql`
query getUser($username: String!) {
  user(username: $username) {
    id
    username
    displayName
    photo
    bio
    createdAt
    tweets {
      id
      tweet
      createdAt
      from {
        id
        username
        displayName
        photo
      }
    }
  }
}
`;

export const deleteTweetMutation = gql`
mutation deleteTweet($id: ID!) {
  deleteTweet(id: $id) {
    id
    tweet
    createdAt
    from {
      id
      username
      displayName
      photo
    }
  }
}
`;