const models = require('./sequelize/index')

const createUser = async user => {
    const newUser = await models.models.Users.create(user);

    return newUser;
};
const updateUser = async user => {

    try {
        usr = await models.models.Users.update(user, { where: { id: user.id } })
        return getUserById(user.id);
    } catch (err) {
        throw new Error(`User doesn't exist.`);
    }
}
const deleteUser = async user => {
    const userToDelete = await getUserById(user.id);
    if (!userToDelete) {
        throw new Error(`User doesn't exist.`);
    }

    await models.models.Users.destroy({ where: { id: user.id } });

    return userToDelete;
};
const getAllUsers = async() => await models.models.Users.findAll();
const getUserById = async id => await models.models.Users.findByPk(id);
const getUserByUsername = async(username) => await models.models.Users.findOne({ where: {username}});

module.exports = {
    createUser,
    updateUser,
    deleteUser,
    getAllUsers,
    getUserById,
    getUserByUsername
};