const resolvers = require('../resolvers');
const typeDefs = require('../schema');
const { createTestClient } = require('apollo-server-testing');
const { ApolloServer, MockList } = require('apollo-server');
const { GET_USERS, CREATE_TWEET, GET_USERS_BY_USERNAME, GET_TWEETS } = require('./test-queries');

// const mocks = {
//     Query: () => ({
//         users: () => new MockList(5)
//     }),
//     Int: () => 6,
//     String: () => 'LosUsername',
//     Date: () => ''
    
// };

const constructTestServer = () => {
    
    const server = new ApolloServer({
        typeDefs,
        resolvers,
        // mocks:mocks,
    });
    
    return server;
};
const server = constructTestServer();
const { query } = createTestClient(server);

// describe('get user', () => {
//     it('returns users list', async() => {
//         //Act
//         const res = await query({ query: GET_USERS });
//         console.log(res.data.users)
        
//         //Assert
//         expect(res.data.users.length).toEqual(5);
//     });
// });

jest.mock('../db/sequelize/users', () => () => {
    const SequelizeMock = require("sequelize-mock");
    const dbMock = new SequelizeMock();

    return dbMock.define('users',{  
        id: 1,
        username: 'abardy',
        displayName: 'Anthony Bardy',
        bio: 'about me',
        email: 'test@test.te',
        photo: ':)',
        createdAt: '2019-06-03 13:13:45',
        updatedAt: '2019-06-03 13:13:45',
    })});

    jest.mock('../db/sequelize/tweets', () => () => {
        const SequelizeMock = require("sequelize-mock");
        const dbMock = new SequelizeMock();

        return dbMock.define('tweets',     {
            id: 1,
            tweet: 'my first tweet',
            createdAt: '2019-06-03 13:13:45',
            from: 'abardy'
        });
    });


    describe('get user', () => {
        it('returns users list', async() => {
            //Arrange
            const expected = [{
                id: "1",
                username: 'abardy',
                displayName: 'Anthony Bardy',
                bio: 'about me',
                photo: ':)',
                createdAt: '2019-06-03 13:13:45',
                tweets: [  {
                    tweet: 'my first tweet',
                    createdAt: '2019-06-03 13:13:45',
                }]
            }];

            //Act
            const res = await query({ query: GET_USERS });
            console.log(res.data.users)

            //Assert
            expect(res.data.users.length).toEqual(1);
            expect(res.data.users).toEqual(expected);
        });


        it('returns user by username with 1 tweets', async() => {
            //Arrange
            const expected = [{
                id: "1",
                username: 'abardy',
                displayName: 'Anthony Bardy',
                bio: 'about me',
                photo: ':)',
                tweets: [{
                    tweet: 'my first tweet',
                }]
            }];

            //Act
            const res = await query({ query: GET_USERS_BY_USERNAME, variables: { username: "abardy" } });
            console.log(res.data.user);

            //Assert
            expect(res.data.user.username).toEqual("abardy");
            expect(res.data.user.tweets.length).toEqual(1);
        });
    });

    describe('create tweet', () => {
        it('returns created tweet', async() => {
            //Arrange
            const expected = {
                id: '1',
                createdAt: '2019-06-03 13:13:45',
                tweet: 'Whatever',
                from:  {
                    id: '1',
                    username: 'abardy',
                    createdAt: '2019-06-03 13:13:45',
                    displayName: 'Anthony Bardy',
                    bio: 'about me',
                    photo: ':)'        
                }
            }

            //Act
            const res = await query({ query: CREATE_TWEET, variables: { from: "abardy", tweet: "Whatever" } });            
            console.log(res.data)

            //Assert
            expect(res.data.createTweet).toEqual(expected);
        });
    });