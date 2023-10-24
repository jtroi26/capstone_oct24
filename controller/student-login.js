const mysql = require("mysql");
const express = require('express');
const rateLimit = require("express-rate-limit");

const maxLoginAttempts = 5;

const loginLimiter = rateLimit({
    windowMs: 1 * 60 * 1000, // 5 minutes window
    max: maxLoginAttempts, // Maximum number of login attempts
    handler: function (req, res) {
        res.render('student-login', { error: 'You have reached the maximum login attempts. ratelimit' });
    }
});

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getLoginPage = (req, res) => {
    res.render('student-login');
};

exports.postStudentLogin = [loginLimiter, (req, res) => {
    const { studentID, studentpassword } = req.body;

    // Check if the login attempts counter exists in the session
    req.session.loginAttempts = req.session.loginAttempts || 0;

    // Define the maximum login attempts


    // if (req.session.loginAttempts >= maxLoginAttempts) {
    //     // If the user has exceeded the maximum login attempts, reject the login
    //     // If maximum login attempts reached, show an error message
    //     return res.render('student-login', { error: 'You have reached the maximum login attempts.' });
    // }

    const sql = `SELECT s.firstname, s.middlename, s.lastname FROM students AS s INNER JOIN studentlogins AS sl ON s.studentID = sl.studentID WHERE sl.studentID = ? AND sl.studentpassword = ?`;

    const values = [studentID, studentpassword];
    const connection = mysql.createConnection(conn);
    connection.query(sql, values, (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                // Reset the login attempts counter on successful login

                // Make sure "section" is included in the SQL query
                const firstname = results[0].firstname;
                req.session.studentfirstname = firstname;
                const middlename = results[0].middlename;
                req.session.studentmiddlename = middlename;
                const lastname = results[0].lastname;
                req.session.studentlastname = lastname;
                // Make sure "section" is included in the SQL query
                req.session.studentID = studentID;

                // Login successful
                // Render the student dashboard EJS template with user data
                console.log('Already login');
                res.redirect('/student/dashboard');
            } else {
                // Increment the login attempts counter
                req.session.loginAttempts++;

                // Login failed
                console.log('Login Failed');
                return res.render('student-login', {error: 'Invalid username or password for student.'});
            }
        }
    });
}
];
