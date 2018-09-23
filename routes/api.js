var express = require('express');
var router = express.Router();
const UsersController = require('../controllers/users');


/* GET users */
router.get('/users', UsersController.getAll);

/* GET user  */
router.get('/users/:id', UsersController.getById);

/*MODIFY user */
router.put('/users/:id', UsersController.put);

/* DELETE users */
router.delete('/users/:id', UsersController.deleteById);

/* ADD new users */
router.post('/users', UsersController.create);

/* hint */
router.post('/users/:hint', UsersController.hint);

module.exports = router;






// var users = [];
// connection.query('SELECT * from users', function (err, rows, fields) {
//     if (err) throw err
//
//     console.log(rows);
//     users.push(rows);
// })
