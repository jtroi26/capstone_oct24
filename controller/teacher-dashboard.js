const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'tesstt',
    user: 'root',
    password: ''
};

exports.getTeacherDashboard = (req, res) => {
    res.render('teacher-dashboard', {teacherusername: req.session.teacherlogin});
};