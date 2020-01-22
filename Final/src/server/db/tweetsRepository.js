const models = require('./sequelize/index')

const createTweet = async tweet => await models.models.Tweets.create(tweet);

const deleteTweet = async tweet => {
    const tweetToDelete = await getTweetById(tweet.id);
    if (!tweetToDelete) {
        throw new Error(`tweet doesn't exist.`);
    }
    await models.models.Tweets.destroy({ where: { id: tweet.id } });

    return tweetToDelete;
};
const getAllTweets = async() => await models.models.Tweets.findAll();
const getTweetById = async id => await models.models.Tweets.findByPk(id);
const getTweetsFrom = async(username, first, offset) => {
    var tst = await models.models.Tweets.findAll({ where: { from: username } })
    console.log(tst)

    return tst
}

module.exports = {
    createTweet,
    deleteTweet,
    getAllTweets,
    getTweetById,
    getTweetsFrom,
};