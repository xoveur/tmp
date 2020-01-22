const { gql } = require('apollo-server');
const { resolverMap } = require('./date-resolver');

const schema = gql `
  type Mutation {
    createTweet(tweet: String!, from: String!): Tweet!
    deleteTweet(id: ID!): Tweet!
    createUser(
      username: String!
      bio: String
      displayName: String
      photo: String
    ): User!
    updateUser(
      id: ID!
      bio: String
      displayName: String
      photo: String
    ): User!
    deleteUser(id: ID!): User!
  }

  type Query {
    me: User
    user(username: String!): User
    users: [User!]!
    tweet(id: ID!): Tweet
    tweets: [Tweet!]!
  }
  scalar Date

  type Tweet {
    id: ID!
    createdAt: Date!
    tweet: String!
    from: User!
  }

  type User {
    id: ID!
    createdAt: String!
    username: String!
    displayName: String
    bio: String
    email: String
    photo: String
    tweets(first: Int, offset: Int): [Tweet!]!
  }
`;

module.exports = schema;