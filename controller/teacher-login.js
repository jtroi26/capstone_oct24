const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getLoginPage = (req, res) => {
    res.render('teacher-login');
};

exports.postTeacherLogin = (req, res) => {
    const connection = mysql.createConnection(conn);

    const { userlogin, userpassword } = req.body;

    // Use placeholders in the SQL query
    const sql = 'SELECT userlogin, userpassword FROM teacherlogin WHERE userlogin = ? AND userpassword = ?';

    console.log(userlogin);
    console.log(userpassword);
    connection.query(sql, [userlogin, userpassword], (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                req.session.teacherlogin = userlogin;
                // Login successful
                res.redirect('/teacher/dashboard');
            } else {
                // Login failed
                res.send('Login failed');
            }
        }
        connection.end();
    });
};