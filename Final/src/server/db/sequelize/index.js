const Sequelize = require("sequelize");

const sequelize = new Sequelize('postgres://postgres:postgres@localhost/CarbonTwitter', {
dialect: 'postgres',
port: 5432
});

const Users = require('./users')(sequelize, Sequelize);
const Tweets = require('./tweets')(sequelize, Sequelize);

const models = {
    Users,
    Tweets
};

Object.keys(models).forEach((key) => {
    if ("associate" in models[key]) {
        models[key].associate(models);
    }
});

module.exports = {
    sequelize,
    models
};