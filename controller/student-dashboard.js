const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getStudentDashboard = (req, res) => {

        // Check if the user is authenticated by verifying the session
            res.render('student-dashboard', {
                studentID: req.session.studentID,
                firstname: req.session.studentfirstname,
                middlename: req.session.studentmiddlename,
                lastname: req.session.studentlastname,
            });

};