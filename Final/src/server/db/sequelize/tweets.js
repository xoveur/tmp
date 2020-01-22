module.exports = function(sequelize, DataTypes) {
    return sequelize.define("tweets", {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        createdAt: DataTypes.TIME,
        tweet: DataTypes.STRING,
        from: DataTypes.STRING,
    })
}