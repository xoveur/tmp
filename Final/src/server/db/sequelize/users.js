module.exports = function(sequelize, DataTypes) {
    return sequelize.define("users", {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        createdAt: DataTypes.DATE,
        username: DataTypes.STRING,
        bio: DataTypes.STRING,
        displayName: DataTypes.STRING,
        email: DataTypes.STRING,
        photo: DataTypes.STRING,
    })
}