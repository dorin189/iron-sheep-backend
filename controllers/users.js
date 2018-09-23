const connection = require("../database-connection/mysql");
const bcrypt = require('bcrypt');
const Joi = require('joi');


exports.getAll = (req, res) => {
    selectAll(res);
};

exports.getById = (req, res) => {
    const userId = parseInt(req.params.id);
    selectById(userId, res);
};

exports.put = (req, res) => {
    const result = validateUser(req.body);
    if (result.error) return res.status(400).send(JSON.stringify(result.error.details[0].message));

    const saltRounds = 10;
    let password = bcrypt.hashSync(req.body.password, saltRounds);
    const userId = parseInt(req.params.id);

    var user = {
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        user_name: req.body.user_name,
        password: password,
        email: req.body.email,
        is_disabled: 0,
        updated_at: Date.now()
    };

    updateUser(res, user, userId);
}

exports.deleteById = (req, res) => {
    const userId = parseInt(req.params.id);
    softDeleteUserById(userId, res);
};

exports.create = (req, res) => {
    const result = validateUser(req.body);
    if (result.error) return res.status(400).send(JSON.stringify(result.error.details[0].message));

    const saltRounds = 10;
    let password = bcrypt.hashSync(req.body.password, saltRounds);

    var user = {
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        user_name: req.body.user_name,
        password: password,
        email: req.body.email,
        is_disabled: 0,
        created_at: Date.now()
    };

    createUser(res, user);
};

exports.hint = (req, res) => {
    var hint = req.body.hint;
    if(hint === null || hint === '') {
        return res.status(400).send(JSON.stringify('Please add data in the input field!'));
    }
    connection.query('SELECT * from users WHERE first_name like ?  and is_disabled = 0', '%' + hint + '%' , function (err, user) {
        res.setHeader('Content-Type', 'application/json');
        if (user.length === 0) return res.status(404).send(JSON.stringify('The user was not found!'));
        else res.send(user);
    });
};

function validateUser(user) {
    const userSchema = {
        first_name: Joi.string().min(3).required(),
        last_name: Joi.string().min(3).required(),
        user_name: Joi.string().min(5).required(),
        password: Joi.string().min(6).required(),
        email: Joi.string().email().required()
    };

    return Joi.validate(user, userSchema);
}

function selectById(userId, res) {
    connection.query('SELECT id, first_name, last_name, user_name, email from users WHERE id = ? and is_disabled = 0', userId, function (err, user) {
        res.setHeader('Content-Type', 'application/json');
        if (user.length === 0) return res.status(404).send(JSON.stringify({error: 'The user id was not found'}));
        else res.send(user);
    });
}

function softDeleteUserById(userId, res) {
    connection.query('SELECT * from users WHERE id = ?', userId, function (err, user) {
        res.setHeader('Content-Type', 'application/json');
        if (user.length === 0) return res.status(404).send(JSON.stringify({error: 'The user id was not found'}));
    });

    connection.query('UPDATE users SET is_disabled = 1 where id=?', userId, function(err, user) {
    });

    connection.query('SELECT id, first_name, last_name, user_name, email from users where is_disabled = 0', function (err, users) {
        res.send(users);
    })
}


function selectAll(res) {
    connection.query('SELECT id, first_name, last_name, user_name, email from users where is_disabled = 0', function (err, users) {
        res.send(users);
    })
}

function createUser(res, user) {
    connection.query('INSERT INTO users SET ?', user, (err, users) => {
        if(!err) {
            connection.query('SELECT * from users', function (err, users) {
                res.send(users);
            });
        }
    });
}

function updateUser(res, userData, userId) {
    var query = 'UPDATE users SET first_name =?, last_name =?, user_name =?, password =?, email =?  WHERE id=?';

    connection.query(query, [userData.first_name, userData.last_name, userData.user_name, userData.password, userData.email, userId], (err, user) => {
        console.log(err);
        console.log(user);
        res.send(user);
    });
}




